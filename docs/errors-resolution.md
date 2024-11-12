# Common Errors During Docker Installation of Eramba

When installing Eramba using Docker, users may encounter several common issues. Below are some of the most frequently reported errors and their solutions:

## 1. Environmental Variable Issues

- **Error**: Changes to the `.env` file do not take effect unless the Docker containers are restarted.
- **Solution**: Always stop the containers before modifying the `.env` file and restart them afterward for the changes to take effect. This ensures that the new environment variables are loaded properly.
- **Reference**: [Eramba Docker Installation Guide](https://github.com/eramba/docker)&#8203;:contentReference[oaicite:0]{index=0}

## 2. Database Connection Errors

- **Error**: "Connection to MySQL could not be established."
- **Cause**: This error is typically caused by permission issues with MySQL configuration files in the Docker container.
- **Solution**: Run the following command to fix permission-related issues:
  ```bash
  chmod 755 docker/mysql -R
  ```
- **Reference**: [Eramba Docker Issues](https://github.com/eramba/docker/issues/12)&#8203;:contentReference[oaicite:1]{index=1}&#8203;:contentReference[oaicite:2]{index=2}

## 3. CSRF Token Errors

- **Error**: "CSRF Invalid Token" errors occur.
- **Cause**: This issue may arise from repeatedly clicking without waiting for the page to load or using the same browser session across multiple accounts.
- **Solution**: Clear browser cookies and sessions to resolve CSRF token validation issues.
- **Reference**: [Eramba Docker Troubleshooting](https://github.com/eramba/docker/issues/13)&#8203;:contentReference[oaicite:3]{index=3}&#8203;:contentReference[oaicite:4]{index=4}

## 4. Incorrect Public Address Setting

- **Error**: Issues such as settings not saving or logos not loading due to incorrectly configured public addresses in the `.env` file.
- **Solution**: Make sure that the public address is correctly set in the `.env` file before deploying containers. Any changes to this setting should be followed by stopping and redeploying the containers.
- **Reference**: [Eramba Docker Documentation](https://eramba.org/docs/docker-installation)&#8203;:contentReference[oaicite:5]{index=5}

## 5. Image Switching for Updates

- **Error**: Problems when updating the Eramba Docker image.
- **Solution**: To update, stop the containers, remove the old images, pull the new version, and ensure that data persistence (especially for databases) is maintained.
- **Reference**: [Eramba Docker Updates](https://github.com/eramba/docker/issues/14)&#8203;:contentReference[oaicite:6]{index=6}&#8203;:contentReference[oaicite:7]{index=7}

## Conclusion

These are some of the most common issues faced during the installation of Eramba with Docker. Checking the container logs and ensuring that configurations are correct can help troubleshoot many problems effectively.

For detailed troubleshooting steps and further assistance, refer to the official documentation and community discussions:

- [Eramba Docker GitHub Repository](https://github.com/eramba/docker)
- [Eramba Installation Guide](https://eramba.org/docs/docker-installation)
