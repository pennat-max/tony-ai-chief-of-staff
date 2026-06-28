# iOS Shortcuts Setup Guide (Tony Tracer Bullet)

To test the Tracer Bullet ingestion pipeline, you must configure an iOS Shortcut Automation on the test device (iPhone running iOS 27+).

## Prerequisites
1. Build and install the `TonyTracerBullet` app on the iPhone via Xcode.
2. Open the app at least once so iOS registers the App Intent.

## Step-by-Step Configuration

1. Open the native **Shortcuts** app on the iPhone.
2. Tap the **Automation** tab at the bottom.
3. Tap the **+** button in the top right corner.
4. Scroll down and select the **Notification** trigger.
5. Tap **Choose App** and select **LINE** (or whatever app you are testing with).
6. Leave "Title" and "Message" filters blank (to trigger on *all* messages).
7. Select **Run Immediately** (IMPORTANT).
8. Turn **OFF** "Notify When Run" (IMPORTANT: this makes it silent).
9. Tap **Next**.
10. Tap **New Blank Automation**.
11. Tap **Add Action**.
12. Search for **"TonyTracerBullet"** or **"Ingest Message to Tony"**.
13. Tap the **Ingest Message to Tony** action.
14. Now map the parameters:
    - Tap the **Sender** parameter. Above the keyboard, tap **Select Variable**, swipe to find **Shortcut Input**, tap it, then tap it again and select **Title**.
    - Tap the **Message Body** parameter. Tap **Select Variable**, swipe to find **Shortcut Input**, tap it, then tap it again and select **Body**.
    - Tap the **Received At** parameter. Tap **Select Variable**, swipe to find **Current Date**.
15. Tap **Done**.

## The Acceptance Test

1. Ensure the TonyTracerBullet app is **closed** (swipe it away in the app switcher).
2. Have someone send a LINE message to the iPhone.
3. The native LINE notification banner should appear.
4. Open the TonyTracerBullet app.
5. The message (Sender, Body, and Timestamp) should appear in the list.

If the message appears, the Tracer Bullet is a success. We have achieved silent background ingestion.
