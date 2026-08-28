# mrcOPTIMIZER 🚀

**mrcOPTIMIZER** is an open-source, lightweight batch script designed to streamline and optimize Windows 10 and 11 systems. It aims to maximize system performance, improve gaming responsiveness, enhance user privacy, and remove non-essential bloatware, telemetry, and background services with a single run.

---

## ⚡ Key Features

### 🛡️ Privacy & Telemetry Reduction
* **Global Telemetry:** Disables core Windows Data Collection, diagnostic loggers, and system event tracking.
* **Privacy Hardening:** Turns off advertising IDs, keylogging/typing telemetry, biometric data gathering, and location tracking.
* **User Activity Logging:** Disables Timeline activity feed, user activity publishing, and cross-device clipboard sync.

### 🤖 AI, Copilot & Windows Recall
* **Windows Copilot:** Removes integrated Copilot policies and uninstalls AppX dependencies across all users.
* **Recall & AI Analytics:** Disables Windows AI Data Analysis and Recall snapshot background features.
* **Edge Integration:** Removes Copilot sidebar and generative AI input tools from Microsoft Edge.

### 🌐 Web Search & Bloatware Cleanup
* **Windows Search:** Removes Bing web suggestions, search highlights, dynamic news feeds, and cloud indexing from the Start Menu.
* **System Bloatware:** Uninstalls non-essential pre-installed UWP packages (e.g., Xbox App, Your Phone, Get Help, People).
* **Temporary Files:** Cleans Windows Update download cache, temporary user/system files, and empties the Recycle Bin.

### 🎮 Gaming & System Performance
* **GPU & CPU Tweaks:** Enables Hardware-Accelerated GPU Scheduling (HAGS), automated Game Mode, and adjusts priority for game executables.
* **Power & UI Responsiveness:** Disables aggressive CPU Power Throttling and window animations for immediate responsiveness.
* **Background Services:** Disables redundant services such as DiagTrack, MapsBroker, Fax, and Remote Registry.

---

## 📋 System Requirements

* **Supported OS:** Windows 10 (1809 or higher) / Windows 11 (All versions)
* **Privileges:** Administrator Rights (required for registry modifications and service management)
* **Execution Environment:** Standard Windows Command Prompt (`cmd.exe`)

---

## 🛠️ Usage Instructions

1. **Create a Restore Point:** It is always recommended to create a System Restore Point before making system-wide changes.
2. **Download:** Clone the repository or download the latest release of `mrcOPTIMIZER.bat`.
3. **Execute as Administrator:** 
   * Right-click on `mrcOPTIMIZER.bat`.
   * Click **"Run as administrator"**.
4. **Follow On-Screen Prompts:** Press `ENTER` to initiate the batch execution.
5. **Reboot:** Restart your PC once the script finishes to ensure all registry and service changes take effect.

---

## ⚠️ Disclaimer & Safety

* **Use at your own risk:** This script applies system-level tweaks. While designed to be non-destructive, environment configurations vary.
* **Reversibility:** Registry modifications can be reverted manually or by restoring your created Restore Point.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE) — free to modify, distribute, and use commercially.
