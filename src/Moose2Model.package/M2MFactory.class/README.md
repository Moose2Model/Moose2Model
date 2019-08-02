I provide instances that may be replaced during tests.
I am responsible for storing instances provided by tests and I instanciate them for productive usage. I may or may not keep a unique instance of an instance I instanciated.
My setter methods are called by tests. My getters are called in the coding to support mock instances in tests.