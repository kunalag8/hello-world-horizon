resource "local_file" "hello_world"{
    content = file("./HelloWorldReader.py") # has space, may cause issues on certain file systems
    filename = "./helloworldreader.py"
}