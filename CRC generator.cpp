#include <bits/stdc++.h>
#include <windows.h>
using namespace std;

// XOR operation between two binary strings
string getxor(const string &a, const string &b) {
    string result;
    for (int i = 0; i < a.length(); ++i) {
        result += (a[i] == b[i]) ? '0' : '1';
    }
    return result;
}

// Function to calculate CRC
string getcrc(string data, const string &generator) {
    int l = generator.length();

    // Append (l - 1) zeros to the data
    data += string(l - 1, '0');

    string remainder = data.substr(0, l);

    for (int i = l; i <= data.length(); ++i) {
        if (remainder[0] == '1')
            remainder = getxor(remainder, generator);
        else
            remainder = getxor(remainder, string(l, '0'));

        if (i < data.length())
            remainder = remainder.substr(1) + data[i];
    }

    return remainder.substr(1); // Remove the first bit
}

int main() {
    string data, generator;
    cout << "Enter the data bits: ";
    cin >> data;
    cout << "Enter the generator polynomial: ";
    cin >> generator;

    string crc = getcrc(data, generator);
    cout << "\nCRC = " << crc << endl;

    string transmitted = data + crc;
    cout << "Transmitted data (data + CRC): " << transmitted << endl << endl;

    cout << "Enter the received bits: ";
    string received;
    cin >> received;

    string check = getcrc(received, generator);

    bool error = check.find('1') != string::npos;

    if (error) {
        system("Color 0C");
        cout << "Error Detected in received data!" << endl;
    } else {
        system("Color 0A");
        cout << "No Error Detected. Data is correct!" << endl;
    }

    return 0;
}

