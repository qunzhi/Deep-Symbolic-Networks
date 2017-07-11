#ifndef _MNIST_H
#define _MNIST_H

#include <string>
#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

int ReverseInt(int i);

template<typename T>
bool ReadImages(const char* filename, vector<vector<T> > &arr, int& n_rows, int& n_cols) {
    n_rows = 0;
    n_cols = 0;

    ifstream file(filename, ios::binary);
    if (file.is_open()) {
        int magic_number = 0;
        int number_of_images = 0;
        int data_of_an_image = 0;
        file.read((char*)&magic_number, sizeof(magic_number));
        magic_number = ReverseInt(magic_number);
        file.read((char*)&number_of_images, sizeof(number_of_images));
        number_of_images = ReverseInt(number_of_images);
        file.read((char*)&n_rows, sizeof(n_rows));
        n_rows = ReverseInt(n_rows);
        file.read((char*)&n_cols, sizeof(n_cols));
        n_cols = ReverseInt(n_cols);
        data_of_an_image = n_rows * n_cols;
        arr.resize(number_of_images, vector<T>(data_of_an_image));

        for(int i = 0; i < number_of_images; ++i) {
            for(int r = 0; r < n_rows; ++r) {
                for(int c = 0; c < n_cols; ++c) {
                    unsigned char temp = 0;
                    file.read((char*)&temp, sizeof(temp));
                    arr[i][(n_rows * r) + c] = (T)temp;
                }
            }
        }

        return true;
    }

    return false;
}

template<typename T>
bool ReadLabels(const char* filename, vector<T> &arr) {
    ifstream file(filename, ios::binary);
    if (file.is_open()) {
        int magic_number = 0;
        int number_of_lables = 0;
        file.read((char*)&magic_number, sizeof(magic_number));
        magic_number = ReverseInt(magic_number);
        file.read((char*)&number_of_lables, sizeof(number_of_lables));
        number_of_lables = ReverseInt(number_of_lables);
        arr.resize(number_of_lables, (T)0);
        for (int i = 0; i < number_of_lables; i++) {
            unsigned char temp = 0;
            file.read((char*)&temp, sizeof(temp));
            arr[i] = (T)temp;
        }

        return true;
    }

    return false;
}

#endif
