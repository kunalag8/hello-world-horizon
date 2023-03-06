import logging # import the logging module to handle logging messages 
import os  # import the os module to access environment variables
from dotenv import load_dotenv #this allows me to load the environment variables from the env file

# Configure the logging settings
# Set the log format and level, and create a log file named "helloworldreader.log" in append mode. Sets the format of the logs written to the log files
logging.basicConfig(filename='helloworldreader.log', filemode='a', format='%(asctime)s - %(levelname)s - %(message)s', level=logging.INFO)

# Create a console handler and set its level to INFO (higher than DEBUG)
console_handler = logging.StreamHandler()
console_handler.setLevel(logging.INFO)

# Set the formatter for the console handler. Sets the format of the logs that are output to the console
formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
console_handler.setFormatter(formatter)

# Add the console handler to the logger
logging.getLogger().addHandler(console_handler)

# Define the main function
def HelloWorldReader():
    # Log that the function has started
    logging.info('Starting HelloWorldReader')
    
    # Output all environment variables to the console - these are system set, not to be confused with the logging, that's what THE PROGRAM is doing in a particular moment - the logging is written to a local file
    logging.info('Printing environment variables:')
    for key, value in os.environ.items():
        print(f"{key}:{value}")

    load_dotenv()

    #access the environment variable inserted by ansible from the yml file
    my_var = os.environ.get('TestMessage')
    logging.info(f"TestMessage: {my_var}")
    
    # Log that the function has finished
    logging.info('Finished HelloWorldReader')

    # Output "Hello World!" 
    print("Hello World!")

    #logging.info(os.environ['TestMessage'])

    

# Check if the code is being executed as the main program
if __name__ == '__main__':
    # Call the main function
    HelloWorldReader()
