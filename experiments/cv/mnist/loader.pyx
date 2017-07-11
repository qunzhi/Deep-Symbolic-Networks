import matplotlib.pyplot as plt
from libcpp.vector cimport vector
from libcpp cimport bool
from libc.stdint cimport *
import numpy as np

cdef extern from "mnist.h":
    cdef bool ReadImages[T](const char*, vector[vector[T]]&)
    cdef bool ReadLabels[T](const char*, vector[T]&)


cdef class mnist:
    cdef:
        vector[vector[uint8_t]] training_images
        vector[vector[uint8_t]] testing_images
        vector[uint8_t] training_labels
        vector[uint8_t] testing_labels
        int n_rows
        int n_cols

    def __cinit__(self, data_path):
        training_images_fname = ("%s/train-images-idx3-ubyte" % data_path).encode('utf-8')
        training_labels_fname = ("%s/train-labels-idx1-ubyte" % data_path).encode('utf-8')
        testing_images_fname = ("%s/t10k-images-idx3-ubyte" % data_path).encode('utf-8')
        testing_labels_fname = ("%s/t10k-labels-idx1-ubyte" % data_path).encode('utf-8')

        ReadImages[uint8_t](training_images_fname, self.training_images, self.n_rows, self.n_cols)
        ReadLabels[uint8_t](training_labels_fname, self.training_labels)
        ReadImages[uint8_t](testing_images_fname, self.testing_images, self.n_rows, self.n_cols)
        ReadLabels[uint8_t](testing_labels_fname, self.testing_labels)

    def read_images(self, vector[vector[uint8_t]]& images, int[:] indices, int cols):
        cdef int num = indices.shape[0]
        cdef int rows = (num + cols - 1) // cols
        cdef uint8_t[:, :, :] data
        cdef int i, j, img_idx, k, l
        cdef uint8_t tmp

        imgs = np.zeros((rows * self.n_rows, cols * self.n_cols, 3), dtype=np.uint8)
        data = imgs
        for i in range(rows):
            for j in range(cols):
                img_idx = i * cols + j
                if img_idx < num:
                    for k in range(self.n_rows):
                        for l in range(self.n_cols):
                            tmp = images[img_idx][k * self.n_rows + l]
                            data[i * self.n_rows + k, j * self.n_cols + l, 0] = tmp
                            data[i * self.n_rows + k, j * self.n_cols + l, 1] = tmp
                            data[i * self.n_rows + k, j * self.n_cols + l, 2] = tmp

        return imgs

    def plot_images(self, int[:] indices, int cols, img_set='training'):
        if img_set == 'training':
            imgs = self.read_images(self.training_images, indices, cols)
        else:
            imgs = self.read_images(self.testing_images, indices, cols)

        plt.figure()
        plt.imshow(imgs)

