#include <bits/stdc++.h>
using namespace std;

// Convert binary string (LSB first) to decimal
int tonum(string s) {
    int num = 0;
    reverse(s.begin(), s.end()); // Ensure LSB is at index 0
    for (int i = 0; i < s.length(); ++i) {
        if (s[i] == '1') num += (1 << i); // Use bitwise shift
    }
    return num;
}

// Generate hamming code from data
string gethamming(string data) {
    int n = data.length();
    int r = 0;

    // Find number of parity bits needed
    while ((1 << r) < (n + r + 1)) {
        r++;
    }

    string hamming;
    hamming.push_back('0'); // For 1-based indexing

    int pos = 0;
    for (int i = 1; i <= n + r; ++i) {
        if ((i & (i - 1)) == 0) {
            hamming.push_back('0'); // Placeholder for parity bits
        } else {
            hamming.push_back(data[pos++]);
        }
    }

    // Set parity bits
    for (int i = 1; i < hamming.length(); i *= 2) {
        int one = 0;
        for (int j = i; j < hamming.length(); j += 2 * i) {
            for (int k = j; k < j + i && k < hamming.length(); k++) {
                if (hamming[k] == '1') one++;
            }
        }
        hamming[i] = (one % 2) ? '1' : '0';
    }

    hamming.erase(0, 1); // Remove dummy '0'
    return hamming;
}

// Detect error position in received hamming code
int errorfinder(string hamming) {
    hamming = "0" + hamming; // For 1-based indexing
    string error;

    for (int i = 1; i < hamming.length(); i *= 2) {
        int one = 0;
        for (int j = i; j < hamming.length(); j += 2 * i) {
            for (int k = j; k < j + i && k < hamming.length(); k++) {
                if (hamming[k] == '1') one++;
            }
        }
        error.push_back((one % 2) ? '1' : '0');
    }

    return tonum(error); // Position of error (0 if none)
}

int main() {
    string data;
    cout << "Enter the data bits: ";
    cin >> data;

    // Optional: Validate input (only 0s and 1s)
    if (!all_of(data.begin(), data.end(), [](char c) { return c == '0' || c == '1'; })) {
        cout << "Invalid input. Please enter only 0s and 1s.\n";
        return 1;
    }

    string hamming = gethamming(data);
    cout << "Generated Hamming Code: " << hamming << endl << endl;

    cout << "Enter received Hamming code: ";
    string recv;
    cin >> recv;

    int error = errorfinder(recv);

    if (error == 0) {
        cout << "\033[1;32mCorrect! No error detected.\033[0m" << endl; // Green text (Linux/macOS)
    } else {
        cout << "\033[1;31mError detected at position: " << error << "\033[0m" << endl; // Red text
        // Fix the error
        recv[error - 1] = (recv[error - 1] == '1') ? '0' : '1';
        cout << "Corrected code: " << recv << endl;
    }

    return 0;
}
