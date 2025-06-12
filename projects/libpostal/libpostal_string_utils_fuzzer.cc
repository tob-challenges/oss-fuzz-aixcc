#include <stdint.h>
#include <string>

#include <libpostal/libpostal.h>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
    std::string payload(reinterpret_cast<const char *>(data), size);
    libpostal_normalize_string((char*)payload.c_str(), 0);
    return 0;
}
