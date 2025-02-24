%Frequency Shift Keying
clc; % কমান্ড উইন্ডো পরিষ্কার করে
clear; % ওয়ার্কস্পেস থেকে সব ভেরিয়েবল সরায়
close all; % সব ওপেন ফিগার উইন্ডো বন্ধ করে

b=[0 1 0 1 1 1 0];% বাইনারি ডেটা সিকোয়েন্স
n=length(b); %b-এর দৈর্ঘ্য (n=7)
t=0:.01:n; %টাইম ভেক্টর t 0 থেকে 7 পর্যন্ত গিয়েছে। .01 ইন্টারভ্যালে প্রায় 701 পয়েন্ট তৈরি হলো।


for i =1:n
bw(i*100:(i+1)*100)=b(i); %লুপে প্রতিটি বিটকে ১০০ স্যাম্পলে রিপ্রেজেন্ট করছি
end
bw=bw(100:end); % প্রথম 100 স্যাম্পল বাদ দিয়ে ঠিক করছি
sint=sin(2*pi*t); % বেস সাইনওয়েভ (১ Hz ফ্রিকোয়েন্সি) , Carrier Signal

f=10;% ফ্রিকোয়েন্সি সেট করছি 10 Hz
y = sin(2 * pi * f * t);  %উচ্চ ফ্রিকোয়েন্সি সাইনওয়েভ (10 Hz)

subplot(3,1,1);
plot(t,bw) %x-axis: time | y-axis: 0 অথবা 1
grid on;
axis([0 n -2 +2])
title('Binary Signal')

subplot(3,1,2)
plot(t,sint) %দ্বিতীয় সাবপ্লটে sint (১ Hz সাইনওয়েভ)
grid on;
title('Sine Wave')
axis([0 n -2 +2])

subplot(3,1,3)
plot(t,y) %তৃতীয় সাবপ্লটে y (১০ Hz সাইনওয়েভ) দেখাচ্ছি
grid on;
axis([0 n -2 +2])
title('High Frequency Signal')
