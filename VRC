#include <bits/stdc++.h>
#include <windows.h>
using namespace std;

// Converts an integer to 8-bit binary string
string tobin(int n) {
    string bin;
    while (n) {
        bin.push_back((n % 2) + '0');
        n /= 2;
    }
    while (bin.length() < 8) {
        bin.push_back('0'); // Padding to 8 bits
    }
    reverse(bin.begin(), bin.end());
    return bin;
}

// Adds even parity bit to the end of the binary string
string addparity(string s) {
    int one = count(s.begin(), s.end(), '1');
    s.push_back((one % 2 == 0) ? '0' : '1'); // Even parity
    return s;
}

// Checks if the received binary string has parity error
int haserror(const string &s) {
    int one = count(s.begin(), s.end(), '1');
    return one % 2; // 0 = no error, 1 = error
}

int main() {
    string word;
    cout << "Enter a word: ";
    cin >> word;
    int n = word.length();

    vector<string> data(n);
    for (int i = 0; i < n; ++i) {
        data[i] = tobin(word[i]);      // Convert char to 8-bit binary
        data[i] = addparity(data[i]);  // Add parity bit
    }

    cout << "\nData sent with parity bits:\n";
    for (const auto &it : data)
        cout << it << " ";
    cout << "\n\n";

    // Receiver Side
    cout << "Enter received bits (each of " << data[0].length() << " bits):\n";
    vector<string> recv(n);
    for (int i = 0; i < n; ++i) {
        cin >> recv[i];
        if (recv[i].length() != 9) {
            cout << "Invalid input length! Expected 9-bit strings.\n";
            return 1;
        }
    }

    int error = 0;
    for (const auto &it : recv)
        error += haserror(it);

    if (error) {
        system("Color 0C");
        cout << "\nError Detected in received data!" << endl;
    } else {
        system("Color 0A");
        cout << "\nNo Error Detected. Data is correct!" << endl;
    }

    return 0;
}

