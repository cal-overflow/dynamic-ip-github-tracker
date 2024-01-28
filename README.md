# Dynamic IP Address tracker
A simple script that can be leveraged to save a machine's public IP address to a GitHub repository for simple retrieval.

---

### Accessing the IP Address
You can view the latest public IP Address in a couple different ways. One is best for scripting and the other for simply browsing in the web.

**Note:** these URL's depend on your username. The URL will also be different if you have renamed the repository from its original `dynamic-ip-github-tracker`.

#### Plaintext
This is the recommended format if you would like to leverage this dynamic ip tracker in any scripts.

```
https://<token>@raw.githubusercontent.com/<username>/dynamic-ip-github-tracker/main/ip_address.txt
```

#### GitHub UI
```
https://github.com/<username>/dynamic-ip-github-tracker/blob/main/ip_address.txt 
```

**Note:** if the repository is private, this requires you to to be authenticated.

---

### Setup
#### 1. Setup a GitHub [Fine-Grained Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#fine-grained-personal-access-tokens)
The Personal Access Token is needed to allow the script to create and push commits to the repository. 

See the official documentation for [Creating a fine-grained personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#fine-grained-personal-access-tokens).

Following the least-privilege-principle, you're token should be setup in a manner similar to the following:
- **Repository Access**
  - Only select repositories
      - Your fork of the Dynamic IP Address tracker repository
- **Permissions**
  - **Repository Permissions**
    - **Contents**: Read and Write
    - **Metadata**: Read Only
  - **Account Permissions**
    - None

Save a copy of this token. We'll use the token in step 3 and paste it into a file in step 3.

#### 2. Clone repository
Clone the repository (via HTTPS) onto the machine in which you need the IP address tracked.

```bash
$ git clone https://<username>:<token from step 1>@github.com/<username>/dynamic-ip-github-tracker.git
```

<small>The clone method must be HTTPS since authentication will be completed through a personal access token.</small>

#### 3. Save the token
Save the generated token from step 1 into a file called `token` located within the cloned repository on the machine in which you need the IP address tracked. It's unlikely that this token will be needed again, but it's always a good idea to keep a copy.

#### 4. Update the script path
Edit [line 4 of app.sh](./app.sh#L4) to match the cloned repository location. This will ensure the script starts in the correct location when launched by another process.

#### 5. Setup a recurring invocation of the script
Leverage a tool such as [cron](https://man7.org/linux/man-pages/man5/crontab.5.html) to setup a recurring invocation of the script.

A good rule of thumb is to run the script should hourly. \
See an example crontab entry for running the task hourly below.
```
0 * * * * <path to cloned repository>/app.sh
```

