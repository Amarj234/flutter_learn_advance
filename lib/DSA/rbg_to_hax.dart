void main() {
  int red = 250;
  int green = 165;
  int blue = 245;

  String hexColors = rgbToHex(red, green, blue);
  print(hexColors); // Output: #42A5F5
  String hexColor = "#42A5F5";
  Map<String, int> rgb = hexToRgb(hexColor);
  print(rgb);
}

String rgbToHex(int r, int g, int b) {
  // Ensure values are within 0–255
  assert(r >= 0 && r <= 255);
  assert(g >= 0 && g <= 255);
  assert(b >= 0 && b <= 255);

  String toHex(int val) {
    const hexDigits = '0123456789ABCDEF';
    int high = val ~/ 16; // ~/	Integer Division	245 ~/ 16 	15	Get quotient
    int low = val % 16; //  %	Modulus (Remainder)	245 % 16   	5	Get remainder
    return hexDigits[high] + hexDigits[low];
  }

  return "#" + toHex(r) + toHex(g) + toHex(b);
}

Map<String, int> hexToRgb(String hex) {
  // Remove '#' if present
  if (hex.startsWith('#')) {
    hex = hex.substring(1);
  }

  // Ensure hex is 6 characters
  if (hex.length != 6) {
    throw FormatException("Hex code must be 6 characters long");
  }
  // Amarjeet comment
  // String val="FA";
  // Hex Digit=     '0123456789 A  B  C  D  E  F';
  //Decimal Value = '0123456789 10 11 12 13 14 15';
  // F position is 15 so 15*16 =240 f position is 10 so add 240+10=250
  // Parse each pair as base-16 (hex)
  int r = int.parse(hex.substring(0, 2), radix: 16);
  int g = int.parse(hex.substring(2, 4), radix: 16);
  int b = int.parse(hex.substring(4, 6), radix: 16);

  return {'r': r, 'g': g, 'b': b};
}

//4 ÷ 2 = 2 remainder 0   ← last digit
//2 ÷ 2 = 1 remainder 0
//1 ÷ 2 = 0 remainder 1   ← first digit
//4 in binary = 100   4-bit binary of 4 = 0100

// | Hex | Binary |
// | --- | ------ |
// | 0   | 0000   |
// | 1   | 0001   |
// | 2   | 0010   |
// | 3   | 0011   |
// | 4   | 0100   |
// | 5   | 0101   |
// | 6   | 0110   |
// | 7   | 0111   |
// | 8   | 1000   |
// | 9   | 1001   |
// | A   | 1010   |
// | B   | 1011   |
// | C   | 1100   |
// | D   | 1101   |
// | E   | 1110   |
// | F   | 1111   |

//103 ÷ 2 = 51 remainder 1
//51 ÷ 2 = 25 remainder 1
//25 ÷ 2 = 12 remainder 1
//12 ÷ 2 = 6  remainder 0
//6 ÷ 2 = 3  remainder 0
//3 ÷ 2 = 1  remainder 1
//1 ÷ 2 = 0  remainder 1

// → 1100111
// Pad to 8 bits:
//
// Copy
// Edit
// → 01100111 ✅

// | Character | ASCII Decimal |
// | --------- | ------------- |
// | `a`       | 97            |
// | `b`       | 98            |
// | `c`       | 99            |
// | `d`       | 100           |
// | `e`       | 101           |
// | `f`       | 102           |
// | `g`       | 103           |
// | ...       | ...           |

// String number ASCII index number

// | Character | ASCII Decimal |
// | --------- | ------------- |
// | `'0'`     | 48            |
// | `'1'`     | 49            |
// | `'2'`     | 50            |
// | `'3'`     | 51            |
// | `'4'`     | 52            |
// | `'5'`     | 53            |
// | `'6'`     | **54** ✅      |
// | `'7'`     | 55            |
// | `'8'`     | 56            |
// | `'9'`     | 57            |
