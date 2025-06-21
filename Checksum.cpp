#include <bits/stdc++.h>
using namespace std;

// Adds two 8-bit binary strings and returns their 1's complement sum
string add(string a, string b) {
    string sum = "";
    int carry = 0;

    for (int i = 7; i >= 0; i--) {
        int bitA = a[i] - '0';
        int bitB = b[i] - '0';

        int s = bitA + bitB + carry;
        sum += (s % 2) + '0';
        carry = s / 2;
    }

    reverse(sum.begin(), sum.end());

    // Handle overflow carry (wrap-around carry)
    if (carry) {
        string carry_str = "00000001";
        sum = add(sum, carry_str);
    }

    return sum;
}

// Returns 1's complement of the binary string
string complement(string s) {
    for (char &c : s)
        c = (c == '1') ? '0' : '1';
    return s;
}

int main() {
    string a, b;
    cout << "Enter 8-bit binary strings for a and b: ";
    cin >> a >> b;

    if (a.length() != 8 || b.length() != 8) {
        cout << "Both inputs must be 8-bit binary strings.\n";
        return 1;
    }

    string checksum = complement(add(a, b));
    cout << "\nSender Side:" << endl;
    cout << "Data A     : " << a << endl;
    cout << "Data B     : " << b << endl;
    cout << "Checksum   : " << checksum << endl;

    string x, y, z;
    cout << "\nReceiver Side - Enter 3 received 8-bit strings (x, y, checksum): ";
    cin >> x >> y >> z;

    if (x.length() != 8 || y.length() != 8 || z.length() != 8) {
        cout << "All inputs must be 8-bit binary strings.\n";
        return 1;
    }

    string result = add(add(x, y), z);

    // If result is all '1's, then data is correct
    bool correct = (result == "11111111");

    cout << "\nVerification Result: ";
    if (correct)
        cout << "CORRECT" << endl;
    else
        cout << "NOT CORRECT" << endl;

    return 0;
}

