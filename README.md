# Deep-Symbolic-Networks
Development of the [Deep Symbolic Networks (DSN) model](https://github.com/qunzhi/Deep-Symbolic-Networks/blob/master/concept.md) towards the dream of strong AI

1. [Key insights](#key-insights)
2. [Roadmap](#roadmap)
3. [Technique aspects](#technique-aspects)

## Key insights
1. Intelligence is an emergent phenomenon of the complex world, which has a deep, hierarchical structure.
2. Physical things are mapped to symbols in human brains by coarse-graining, so the real world is mapped to a deep symbolic network.
3. Symbols and their combinations sharing common features will produce new symbols, such as more abstract concepts.
5. Symbols are separated by singularities, so it is possible to learn a deep symbolic network by adaptive learning; i.e., unsupervised learning and self correcting adaptive to the outside world.
4. Knowledge can be represented by the symbols and their links, which can be used to adapt to or modify the outside world.
5. Natural languages are the means of humans communicating knowledge encoded in deep symbolic networks, such as definitions of things or concepts, changing states of physical things, processes, and much more.

## Roadmap
Because DSN will do cumulative and adaptive learning, it is unwise to not learn from simplest things. That is indeed a convenient way of disentangling complex interactions between things. Therefore, the first goal of the DSN development is to build a cumulative and adaptive learning system, from learning basic, regular geometric shapes, printing digits, to handwritten digits, i.e. from regular things to irregular things, from easy to hard. 

The idea of cumulative and adaptive learning is that we let the model learn only a small number of symbols at one time, and let it accumulate knowledge, including symbols, links and more abstract concepts it coarse-grains from the data. The learning is done by following the unsupervised learning concept described in the paper. We present knowledge to the model, it learns and shows what it has learned, and corrects the mistakes by adapting to external feedbacks. It can be viewed as a sort of [Active Learning](http://burrsettles.com/pub/settles.activelearning.pdf)<sup>1</sup>.

The cumulative and adaptive learning system may include the following components: an unsupervised, cumulative learning unit, a self-correcting unit to interact with the external world, and a visualization unit to show what it has learned.  


1.　Settles, B. 2009. Active learning literature survey. Computer Sciences Technical Report 1648, University of Wisconsin–Madison.

## Technique aspects
The main programming languages/tools will be Python, Cython and C/C++, to combine both productivity and performance. Any good Python, Cython and C/C++ frameworks will be welcome. 

The CMake modules for Cython are taken from the [scikit-build](https://github.com/scikit-build/scikit-build) project. I do not clone their entire repository because so far this project needs only the Cython modules. Many thanks for their contribution to the community.

