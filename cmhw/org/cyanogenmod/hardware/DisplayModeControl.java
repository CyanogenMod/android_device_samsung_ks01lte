/*
 * Copyright (C) 2015 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.cyanogenmod.hardware;

import java.io.File;
import cyanogenmod.hardware.DisplayMode;
import org.cyanogenmod.hardware.util.FileUtils;

/*
 * Display Modes API
 *
 * A device may implement a list of preset display modes for different
 * viewing intents, such as movies, photos, or extra vibrance. These
 * modes may have multiple components such as gamma correction, white
 * point adjustment, etc, but are activated by a single control point.
 *
 * This API provides support for enumerating and selecting the
 * modes supported by the hardware.
 */

public class DisplayModeControl {
    private static String[] MODES =
        { "DYNAMIC",
          "STANDARD",
          "NATURAL",
          "MOVIE",
          "AUTO" };
    private static String MODE_PATH = "/sys/class/mdnie/mdnie/mode";
    private static int defaultMode = 4;

    /*
     * All HAF classes should export this boolean.
     * Real implementations must, of course, return true
     */
    public static boolean isSupported() {
        File scenarioFile = new File(MODE_PATH);
        return scenarioFile.exists();
    }

    /*
     * Get the list of available modes. A mode has an integer
     * identifier and a string name.
     *
     * It is the responsibility of the upper layers to
     * map the name to a human-readable format or perform translation.
     */
    public static DisplayMode[] getAvailableModes() {
        int i = 0;
        DisplayMode[] displayModes = new DisplayMode[MODES.length];
        for (String mode : MODES) {
            DisplayMode displayMode = new DisplayMode(i, mode);
            displayModes[i] = displayMode;
            i++;
        }
        return displayModes;
    }

    /*
     * Get the name of the currently selected mode. This can return
     * null if no mode is selected.
     */
    public static DisplayMode getCurrentMode() {
        int curMode = 0;
	String currentMode = null;
        String currentModeStr = FileUtils.readOneLine(MODE_PATH)
                                      .split(":")[1]
                                      .trim();
        for (String mode : MODES) {
            if (currentModeStr.equals(mode))
                currentMode = mode;
            curMode++;
        }
        return new DisplayMode(curMode, currentMode);
    }

    /*
     * Selects a mode from the list of available modes by it's
     * string identifier. Returns true on success, false for
     * failure. It is up to the implementation to determine
     * if this mode is valid.
     */
    public static boolean setMode(DisplayMode mode, boolean makeDefault) {
        if (makeDefault)
            defaultMode = mode.id;
        return FileUtils.writeLine(MODE_PATH, String.valueOf(mode.id));
    }

    /*
     * Gets the preferred default mode for this device by it's
     * string identifier. Can return null if there is no default.
     */
    public static DisplayMode getDefaultMode() {
        return new DisplayMode(defaultMode, MODES[defaultMode]);
    }
}
