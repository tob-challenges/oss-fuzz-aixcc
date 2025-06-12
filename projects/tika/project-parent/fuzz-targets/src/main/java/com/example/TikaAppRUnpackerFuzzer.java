/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.example;


import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

import org.apache.commons.io.FileUtils;

import org.apache.tika.cli.TikaCLI;


public class TikaAppRUnpackerFuzzer {
    static Path TMP_DIR;
    static Path EXTRACT_DIR;
    static {
        try {
            TMP_DIR = Files.createTempDirectory("expander-tmp");
            EXTRACT_DIR = TMP_DIR.resolve("output/q/r/s/t");
            Path target = TMP_DIR.resolve("output/q/r/jazzer-traversal");
            System.setProperty("jazzer.file_path_traversal_target",
                    target.toAbsolutePath().toString());
        } catch (IOException e) {
            throw new RuntimeException("couldn't create tmp dir", e);
        }
    }

    public static void main(String[] args) throws Exception {
        byte[] bytes = Files.readAllBytes(Paths.get(args[0]));
        parseOne(bytes);
    }

    public static void fuzzerTestOneInput(byte[] bytes) throws Exception {
        try {
            parseOne(bytes);
        } catch (Exception e) {
            //e.printStackTrace();
        } finally {
            try {
                FileUtils.deleteDirectory(TMP_DIR.toFile());
            } catch (IOException e) {
                //swallow
            }
        }
    }

    private static void parseOne(byte[] bytes) throws Exception {

        Path input = TMP_DIR.resolve("input.bin");
        //limit to loading only two parsers -- zip and text
        Path tikaConfig = TMP_DIR.resolve("tika-config.xml");
        try {
            Files.write(input, bytes);
            writeConfig(tikaConfig);
            TikaCLI.main(
                    new String[]{"-Z",
                            "--config=" + tikaConfig.toAbsolutePath(),
                            "--extract-dir=" + EXTRACT_DIR.toAbsolutePath(),
                            input.toAbsolutePath().toString()});
            //do we need this?
//            Thread.sleep(45000);
        } finally {
            FileUtils.deleteDirectory(EXTRACT_DIR.toFile());
        }
    }

    private static void writeConfig(Path tikaConfig) throws IOException {
        String xml = """
                <?xml version="1.0" encoding="UTF-8"?>
                  <properties>
                    <parsers>
                      <parser class="org.apache.tika.parser.pkg.PackageParser"/>
                      <parser class="org.apache.tika.parser.txt.TXTParser"/>
                    </parsers>
                  </properties>
                """;
        Files.writeString(tikaConfig, xml, StandardCharsets.UTF_8);
    }
}
