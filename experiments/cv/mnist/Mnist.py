from mnist.loader import mnist
import os


class Mnist:
    instance = None

    def __init__(self):
        if not Mnist.instance:
            dir_path = os.path.dirname(os.path.realpath(__file__))
            Mnist.instance = mnist(dir_path)

    def __getattr__(self, name):
        return getattr(self.instance, name)
