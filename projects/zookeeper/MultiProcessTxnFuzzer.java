// Copyright 2024 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////

import org.apache.jute.BinaryInputArchive;
import org.apache.zookeeper.server.DataTree;
import org.apache.zookeeper.server.ServerMetrics;
import org.apache.zookeeper.ZooDefs;
import org.apache.zookeeper.txn.TxnHeader;
import org.apache.zookeeper.txn.CreateTxn;

import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.util.List;
import java.util.ArrayList;

public class MultiProcessTxnFuzzer {
    private static final int MAX_INPUT_LENGTH = 10000;
    private static final int MAX_RECORDS = 10;
    public static void fuzzerTestOneInput(byte[] data) {
        //fuzz tests should be fairly small
        if (data.length > MAX_INPUT_LENGTH) {
            return;
        }

        try {
            DataTree dt = new DataTree();
            try (ByteArrayInputStream is = new ByteArrayInputStream(data);
                 DataInputStream dis = new DataInputStream(is)) {
                int numRecords = dis.readInt();
                if (numRecords > MAX_RECORDS) {
                    return;
                }
                BinaryInputArchive ia = BinaryInputArchive.getArchive(is);
                for (int i = 0; i < numRecords; i++) {
                    TxnHeader txnHeader = new TxnHeader();
                    txnHeader.deserialize(ia, "txnHeader");
                    CreateTxn createTxn = new CreateTxn();
                    createTxn.deserialize(ia, "createTxn");
                    dt.processTxn(txnHeader, createTxn);
                }
            }
        } catch (java.lang.NullPointerException e) {
        } catch (java.io.IOException e) {
        } catch (java.lang.StringIndexOutOfBoundsException e) {
        } catch (java.lang.IndexOutOfBoundsException e) {
        } catch (java.lang.IllegalArgumentException e) {
        } catch (java.lang.ClassCastException e) {
        }
    }
}