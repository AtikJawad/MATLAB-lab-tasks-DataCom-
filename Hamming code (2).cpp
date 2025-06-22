#include <iostream>
#include <string>
#include <cmath>
#include <vector>

using namespace std;

// Calculate number of parity bits required
int calculate_parity_bits(int m) {
    int r = 0;
    while ((1 << r) < (m + r + 1)) r++;
    return r;
}

// Insert parity bit placeholders into data
string insert_parity_placeholders(const string& data, int r) {
    string result(data.length() + r, '0');
    int j = 0;
    cout << "\nPlacing data and parity bits...\n";
    for (int i = 1; i <= result.length(); i++) {
        if ((i & (i - 1)) == 0) {
            cout << "Position " << i << ": Parity placeholder\n";
        } else {
            result[i - 1] = data[j++];
            cout << "Position " << i << ": Data bit = " << result[i - 1] << endl;
        }
    }
    return result;
}

// Set parity bits using even parity
void set_parity_bits(string& code) {
    int n = code.length();
    cout << "\nCalculating parity bits...\n";
    for (int i = 0; (1 << i) <= n; i++) {
        int parity_pos = (1 << i);
        int parity = 0;
        cout << "Parity bit at position " << parity_pos << " checks: ";
        for (int j = 1; j <= n; j++) {
            if (j & parity_pos) {
                cout << j << "(" << code[j - 1] << ") ";
                parity ^= (code[j - 1] - '0');
            }
        }
        code[parity_pos - 1] = parity + '0';
        cout << "=> Parity = " << parity << endl;
    }
}

// Encode with Hamming code
string hamming_encode(const string& data) {
    int r = calculate_parity_bits(data.length());
    string code = insert_parity_placeholders(data, r);
    set_parity_bits(code);
    return code;
}

// Detect and correct single-bit error
void hamming_decode(string& received) {
    int n = received.length();
    int error_pos = 0;
    vector<int> syndrome_bits;

    cout << "\nChecking parity bits (even parity)...\n";
    for (int i = 0; (1 << i) <= n; i++) {
        int parity_pos = (1 << i);
        int parity = 0;
        for (int j = 1; j <= n; j++) {
            if (j & parity_pos)
                parity ^= (received[j - 1] - '0');
        }
        cout << "Parity bit at position " << parity_pos << ": " << parity << endl;
        if (parity)
            error_pos += parity_pos;
        syndrome_bits.insert(syndrome_bits.begin(), parity); // for binary representation
    }

    cout << "Syndrome (binary): ";
    for (int b : syndrome_bits) cout << b;
    cout << " => Decimal position: " << error_pos << endl;

    if (error_pos > 0) {
        cout << "\n Error detected at bit position: " << error_pos << endl;
        received[error_pos - 1] = (received[error_pos - 1] == '0') ? '1' : '0';
        cout << " Corrected Code: " << received << endl;
    } else {
        cout << "\n No error detected in the received code.\n";
    }
}

int main() {
    string data;
    cout << "Enter binary data to send (max 15 bits): ";
    cin >> data;

    if (data.length() > 15) {
        cout << "❌ Error: Maximum 15 bits allowed.\n";
        return 1;
    }

    string encoded = hamming_encode(data);
    cout << "\n--- Sender Side ---\n";
    cout << "Original Data        : " << data << endl;
    cout << "Hamming Encoded Data : " << encoded << endl;

    string received = encoded;
    int flip;
    cout << "\n--- Transmission Simulation ---\n";
    cout << "Enter bit position to flip (1 to " << received.length() << ", 0 to skip): ";
    cin >> flip;

    if (flip > 0 && flip <= received.length()) {
        received[flip - 1] = (received[flip - 1] == '0') ? '1' : '0';
        cout << "Received Data (with error): " << received << endl;
    } else {
        cout << "Received Data (no error): " << received << endl;
    }

    cout << "\n--- Receiver Side ---\n";
    hamming_decode(received);

    return 0;
}

