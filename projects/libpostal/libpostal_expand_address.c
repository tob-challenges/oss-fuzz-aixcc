#include <stdint.h>
#include <string>

#include <libpostal/libpostal.h>

bool isValidUTF8(const std::string &string) {
  int c, i, ix, n, j;
  for (i = 0, ix = string.length(); i < ix; i++) {
    c = (unsigned char)string[i];
    if (0x00 <= c && c <= 0x7f)
      n = 0;
    else if ((c & 0xE0) == 0xC0)
      n = 1;
    else if (c == 0xed && i < (ix - 1) && ((unsigned char)string[i + 1] & 0xa0) == 0xa0)
      return false;
    else if ((c & 0xF0) == 0xE0)
      n = 2;
    else if ((c & 0xF8) == 0xF0)
      n = 3;
    else
      return false;
    for (j = 0; j < n && i < ix; j++) {
      if ((++i == ix) || (((unsigned char)string[i] & 0xC0) != 0x80)) return false;
    }
  }
  return true;
}


struct PostalState {
    PostalState() {
        if (!libpostal_setup() || !libpostal_setup_parser()) {
            exit(EXIT_FAILURE);
        }
        options = libpostal_get_address_parser_default_options();
    }

    libpostal_address_parser_options_t options;
};

PostalState kPostalState;

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
    std::string storage(reinterpret_cast<const char *>(data), size);

    size_t num_expansions;
    char **expansions = NULL;
    expansions = libpostal_expand_address((char*)storage.c_str(), libpostal_get_default_options(), &num_expansions);

    if (expansions != NULL) {
      libpostal_expansion_array_destroy(expansions, num_expansions);
    }
    return 0;
}

/*
    if (isValidUTF8(storage) == false) {
        return 0;
    }
    libpostal_address_parser_response_t *parsed = libpostal_parse_address(const_cast<char *>(storage.c_str()), kPostalState.options);
    if (parsed) {
        // Touch all the components to ensure they point to valid memory.
        std::string value;
        for (size_t i = 0; i < parsed->num_components; i++) {
            value += parsed->labels[i];
            value += parsed->components[i];
        }
        libpostal_address_parser_response_destroy(parsed);
    }

    return 0;
}
*/
