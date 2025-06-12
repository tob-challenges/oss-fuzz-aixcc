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
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

import org.apache.commons.io.FileUtils;
import org.xml.sax.SAXException;

import org.apache.tika.cli.TikaCLI;
import org.apache.tika.exception.TikaException;


public class TikaAppUntarringFuzzer {
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
        } catch (TikaException | IOException | SAXException e) {
            //e.printStackTrace();
        } finally {
            try {
                FileUtils.deleteDirectory(TMP_DIR.toFile());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private static void parseOne(byte[] bytes) throws IOException, SAXException, TikaException {
        Class untarringClazz = null;
        try {
            untarringClazz = Class.forName("org.apache.tika.cli.TikaUntar");
        } catch (ClassNotFoundException e) {
            return;
        }
        Path input = TMP_DIR.resolve("input.bin");
        Files.write(input, bytes);
        String[] params =
                new String[]{input.toAbsolutePath().toString(),
                        EXTRACT_DIR.toAbsolutePath().toString()};
        try {
            Method m = untarringClazz.getMethod("main", String[].class);
            m.invoke(null, (Object) params);
        } catch (ReflectiveOperationException e) {
            throw new RuntimeException("something went very, very wrong", e);
        }
    }

}
