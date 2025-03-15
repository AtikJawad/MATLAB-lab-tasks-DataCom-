%Phase Shift Keying

clc;    % কমান্ড উইন্ডো পরিষ্কার করে
clear;  % ওয়ার্কস্পেস থেকে সব ভেরিয়েবল সরায়
close all;  %সব ওপেন ফিগার উইন্ডো বন্ধ করে


%b = [0 1 0 1 1 1 0];
b=input('Enter the binary data: ', 's')-'0';
b(b == 0) = -1; % সব 0 কে -1 এ রূপান্তর

%PSK-তে (Phase Shift Keying), বিটগুলোকে +1 এবং -1 আকারে উপস্থাপন করা হয় কারণ এতে ফেজ পরিবর্তন বোঝানো সহজ হয়।

n = length(b);
t = 0:0.01:n; % সময়: 0 থেকে 7 পর্যন্ত, 0.01 ইন্টারভালে, ছোট ইন্টারভাল মানে আরও মসৃণ সিগন্যাল।

for i = 1:n
    bw(i*100:(i+1)*100) = b(i); % প্রতিটি বিটের জন্য 100 স্যাম্পল |  প্রতি সেকেন্ডে 100টি স্যাম্পল নেওয়া হচ্ছে
end
bw = bw(100:end); % প্রথম অতিরিক্ত অংশ বাদ


carrier_signal = sin(2 * pi * t);  %sine wave carrier
st=bw.*carrier_signal; %Modulated Signal

subplot(3, 3, 1);
plot(t, bw, 'LineWidth', 2) %প্লটের লাইনের পুরুত্ব 2 পয়েন্ট করে।
grid on;
title('Binary Signal')
axis([0 n -2 +2])

subplot(3, 3, 2);
plot(t, carrier_signal, 'LineWidth', 2)
grid on;
title('Carrier Signal (Sine Wave)')
axis([0 n -2 +2])

subplot(3, 3, 3);
plot(t,st, 'LineWidth', 2)
grid on;
axis([0 n -2 +2])
title('Phase Shifted Signal') %যেখানে বিট -1, সাইন ওয়েভ উল্টে গেছে (180° শিফট)।
                              %যেখানে বিট +1, সাইন ওয়েভ অপরিবর্তিত।
