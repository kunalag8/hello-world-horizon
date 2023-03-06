resource "local_file" "hello_world"{
    content = file("./HelloWorldReader.py") 
    filename = "./helloworldreader.py"
}