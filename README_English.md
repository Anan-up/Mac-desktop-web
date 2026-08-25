This is a **highly realistic macOS Sonoma-style web desktop simulator**, built entirely with native HTML + CSS + JavaScript, requiring no external dependencies or frameworks. Below is an in-depth summary across three dimensions: technical implementation, interaction logic, and functional modules.

### 1. Core Architecture and Technical Implementation
*   **Pure front-end single-page application**: All code is integrated into a single `index.html` file, using CSS custom properties (`var`) to uniformly manage theme styles (menu height, corner radius, fonts).
*   **Glassmorphism**: Extensive use of `backdrop-filter: blur()` and `saturate()` to achieve the semi-transparent frosted-glass texture of the menu bar, Dock, and windows, faithfully reproducing macOS's visual hierarchy.
*   **Resource loading fault tolerance**: The icon system first attempts to load real images at `assets/icons/<key>.png`; if loading fails, it seamlessly falls back to inline high-fidelity SVG vector icons, ensuring the visual effect is always present.
*   **Wallpaper adaptation**: By default uses a CSS-drawn Sonoma-style gradient wallpaper, while automatically detecting `assets/wallpaper.jpg` and overriding it.

### 2. Interaction and Window Management (rivaling native experience)
*   **Window system**:
    *   Supports **drag-to-move** (via title bar), **corner/edge resizing** (eight directions), **minimize** (zoom animation sinking to the bottom), **maximize** (filling the area between the menu and the Dock).
    *   Clicking a window automatically **focuses and brings it to front** (dynamic `z-index` elevation) and highlights the border shadow.
*   **Dock**:
    *   **Hover magnification effect** (Magnification): Dynamically calculates the scale ratio based on the distance between the mouse and the icon center (up to 2.0×), with smooth transitions.
    *   **Smart auto-hide**: When the mouse moves out of the bottom edge, the Dock automatically slides down and hides; moving to the bottom edge or hovering over the Dock immediately pops it up, fully replicating macOS behavior.
    *   Running apps display a small black dot indicator below their icon.
*   **Global menu bar**: The top-left genuinely responds to clicks to expand the **Apple menu** (containing simulated options like About This Mac, Sleep, Restart), with a real-time clock and Wi-Fi/battery status icons on the right.

### 3. Preset App Functionality Analysis (more than just UI placeholders)
The code embeds 15+ native-style apps, some of which feature **real interaction logic**:

| App Name | Functional Status |
| :--- | :--- |
| **Calculator** | Fully functional, supports basic operations (+, −, ×, ÷), sign toggle, percentage, with rigorous logic (including continuous operations). |
| **Terminal** | Simulates a Bash environment, supports common commands like `help`, `date`, `whoami`, `echo`, `clear`, `neofetch`, `ls`, with highlighted output. |
| **Notes** | Left-side note list can be clicked to switch; the right-side text area updates dynamically and supports manual input editing. |
| **System Settings** | Provides dark mode, Wi-Fi, Bluetooth, and other **toggle components**, including a real-time "automatically hide Dock" control switch (linked to the main interface). |
| **Launchpad** | Full-screen glassmorphism interface displaying all app icons in a grid; click to open the corresponding app. |
| **Finder / Safari / Photos** | Beautifully laid out static UI placeholders for showing the Finder sidebar, Safari address bar, and Photos stream grid layout. |

### 4. Detail and User Experience Polish
*   **Boot animation**: On page load, a black boot screen with a spinning ring is shown, fading out after 1 second, creating a system startup feel.
*   **Right-click menu**: Right-clicking empty desktop space brings up a context menu to quickly open Launchpad, About This Mac, or toggle Dock auto-hide.
*   **Traffic light buttons**: The red (close), yellow (minimize), and green (maximize) buttons in the top-left of windows reveal their corresponding symbols (×, −, +) on hover, precisely reproducing the micro-interactions.

### 5. Conclusion
This is not merely a reskinned interface, but a **lightweight yet complete desktop operating system front-end framework**. It fully leverages modern CSS and the browser event model to implement **multi-window management, spatial interaction (resize/drag/snap), and partial app logic** within a regular web page. Whether for technical learning, personal portfolio showcase, or as a reference implementation for a Web application container (Shell), it demonstrates extremely high completeness and design quality. You can open and run it directly in a browser to enjoy an operating experience close to real macOS.
