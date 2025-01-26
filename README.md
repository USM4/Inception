# Inception Project

This project is designed to deepen your knowledge of system administration using Docker. You will virtualize several Docker images and create a personal virtual machine. Below are the detailed components and explanations of the project.

---

## **Getting Started**

### **Running NGINX in Foreground**
The command below tells NGINX to set a global directive using the `-g` option. It runs NGINX as a foreground process instead of as a daemon (background process), preventing the container from stopping:

>CMD ["nginx", "-g", "daemon off;"]



**Concepts Explained**  

CGI (Common Gateway Interface)  
CGI is a part of web servers that manages how they communicate with the client (browser) via HTTP. It creates a process to run a script (e.g., PHP, Python) for each request.  
  
FastCGI  
Unlike CGI, which creates a new process and loads all modules for every request, FastCGI runs as a daemon (background process). This eliminates the overhead of creating processes and loading modules for each request, improving efficiency.  
  
Volumes  
In Docker, a volume is a method to persist data generated by containers or share data between containers and the host system. Volumes store data independently of the container's lifecycle, ensuring data persists even if the container is removed or replaced.  
  
TLS/SSL  
TLS (Transport Layer Security) and SSL (Secure Sockets Layer) are cryptographic protocols designed to provide secure communication over a network. They establish an encrypted connection between a client (e.g., web browser) and a server (e.g., website), ensuring data transmission   remains confidential and tamper-proof.  
  
MariaDB Access Instructions  
Enter the container:  
  
bash  
Copy  
Edit  
docker exec -it <container_name> bash  
Access MariaDB:  
  
bash  
Copy  
Edit  
mysql -u root  
Run these queries:  
  
Show all databases:  
sql  
Copy  
Edit  
SHOW DATABASES;  
View all users:  
sql  
Copy  
Edit  
SELECT user FROM mysql.user;  
Useful Docker Commands  
Remove All Docker Images and Containers  
bash  
Copy  
Edit  
docker system prune -af  
What Happens When a PHP Request is Sent to NGINX?  
Request Arrives at NGINX  
The server listens for incoming HTTPS connections on port 443.  
  
SSL/TLS Handshake  
NGINX performs an SSL/TLS handshake with the client using the specified certificate and private key.  
  
Server Block Determination  
NGINX determines the correct server block to handle the request using the server_name directive.  
  
Serve Static Files  
If the request is for a static resource (e.g., HTML, CSS, JavaScript), NGINX serves it directly from the specified root directory.  
  
Process PHP Files  
  
For PHP requests, NGINX forwards them to a FastCGI server (php-fpm) via fastcgi_pass.  
PHP-FPM executes the requested PHP script.  
The script generates dynamic HTML content, which is sent back to NGINX.  
Response  
NGINX sends the HTML response back to the client.  
  
This separation of responsibilities improves performance and scalability by offloading PHP execution to PHP-FPM.  
  
Docker Internals  
Namespaces  
Docker uses Linux namespaces to isolate processes, filesystems, and network interfaces, creating separate environments for containers.  
  
cgroups (Control Groups)  
Docker uses cgroups to limit and manage resources such as CPU, memory, and I/O bandwidth for containers, ensuring isolation between them.  
  
Container Runtime  
  
Docker relies on containerd as the default runtime to handle low-level operations like starting/stopping containers and interacting with the Linux kernel.  
The Linux kernel features, such as namespaces and cgroups, are used for container creation and management.  
Global Idea  
The goal of this project is to enhance your understanding of system administration by utilizing Docker. You will learn how to:  
  
Build and manage Docker containers.  
Use Docker features like volumes, namespaces, and cgroups.  
Set up secure communication using TLS/SSL.  
Understand web server architectures with NGINX, FastCGI, and PHP-FPM.  


