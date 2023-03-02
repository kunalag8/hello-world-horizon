resource "local file" "Hello World!"{
    content = file("/Users/Kunal.Agarwala/Documents/Horizon Hello World Challenge/HelloWorldReader.py") # has space, may cause issues on certain file systems
    filename = HelloWorldReader.py
}