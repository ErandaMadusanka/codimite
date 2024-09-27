function encryptInputData() {
  const input = "hello";

  const charSet = new Set();

  for (const char of input) {
    if (charSet.has(char)) {
      return false;
    }
    charSet.add(char);
  }

  const encoder = TextEncoder();
  const data = encoder.encode(input);

  const hashBuffer = crypto.subtle.digest("SHA-256", data);

  const hashArray = Array.from(new Uint8Array(hashBuffer));
  const hashHex = hashArray
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");

  return hashHex;
}
