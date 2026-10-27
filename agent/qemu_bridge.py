import socket
import sys
import threading

# Match the IP and port defined in your Makefile
HOST = '127.0.0.1'
PORT = 5555

def receive_from_xv6(sock):
    """Continuously reads output from xv6 and prints it to the Ubuntu terminal."""
    while True:
        try:
            data = sock.recv(1024)
            if not data:
                print("\n[Bridge] Connection closed by xv6.")
                break
            # Decode and print raw characters from the serial console
            sys.stdout.write(data.decode('utf-8', errors='ignore'))
            sys.stdout.flush()
        except Exception as e:
            print(f"\n[Bridge] Error receiving: {e}")
            break

def main():
    print(f"[Bridge] Connecting to xv6 at {HOST}:{PORT}...")
    
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        sock.connect((HOST, PORT))
        print("[Bridge] Connected successfully! (Press Ctrl+C to exit)\n")
    except ConnectionRefusedError:
        print("[Bridge] Connection failed. Is xv6 running via 'make qemu-agent'?")
        return

    # Start a background thread to listen to xv6 output
    rx_thread = threading.Thread(target=receive_from_xv6, args=(sock,), daemon=True)
    rx_thread.start()

    # Main loop reads inputs from Ubuntu terminal and sends them to xv6
    try:
        while True:
            
            # Read character inputs or commands
            #user_input = input()
            # Append a newline so xv6 executes the command
            #sock.sendall((user_input + '\n').encode('utf-8'))
            
            import time

            # Wait for boot to finish
            time.sleep(2) 

            # Programmatically run the 'ls' command in xv6
            sock.sendall(b"ls\n") 

            
    except KeyboardInterrupt:
        print("\n[Bridge] Exiting bridge script.")
    finally:
        sock.close()

if __name__ == '__main__':
    main()

