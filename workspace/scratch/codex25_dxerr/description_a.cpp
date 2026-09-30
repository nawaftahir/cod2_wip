#include <windows.h>

extern "C" const char *WINAPI DXGetErrorDescription9A(HRESULT hr)
{
    switch (hr)
    {
    case (HRESULT)0x80004004:
        return "Operation aborted";
    case (HRESULT)0x80004003:
        return "Invalid pointer";
    case (HRESULT)0x80004002:
        return "The requested COM interface is not available";
    case (HRESULT)0x80004001:
        return "The function called is not supported at this time";
    case (HRESULT)0x8000000a:
        return "The data necessary to complete this operation is not yet available.";
    case (HRESULT)0x80004005:
        return "An undetermined error occurred";
    case (HRESULT)0x800401f0:
        return "CoInitialize has not been called.";
    case (HRESULT)0x80040154:
        return "Class not registered";
    case (HRESULT)0x80040110:
        return "This object does not support aggregation";
    case (HRESULT)0x8000ffff:
        return "Catastrophic failure";
    case (HRESULT)0x800401f1:
        return "CoInitialize has already been called.";
    case (HRESULT)0x80040200:
        return "Unable to IDirectInputJoyConfig_Acquire because the user does not have sufficient privileges to change the joystick configuration. & An invalid media type was specified";
    case (HRESULT)0x80040201:
        return "The device is full. & An invalid media subtype was specified.";
    case (HRESULT)0x80040202:
        return "Not all the requested information fit into the buffer. & This object can only be created as an aggregated object.";
    case (HRESULT)0x80040203:
        return "The effect is not downloaded. & The enumerator has become invalid.";
    case (HRESULT)0x80040204:
        return "The device cannot be reinitialized because there are still effects attached to it. & At least one of the pins involved in the operation is already connected.";
    case (HRESULT)0x80040205:
        return "The operation cannot be performed unless the device is acquired in DISCL_EXCLUSIVE mode. & This operation cannot be performed because the filter is active.";
    case (HRESULT)0x80040206:
        return "The effect could not be downloaded because essential information is missing.  For example, no axes have been associated with the effect, or no type-specific information has been created. & One of the specified pins supports no media types.";
    case (HRESULT)0x80040207:
        return "Attempted to read buffered device data from a device that is not buffered. & There is no common media type between these pins.";
    case (HRESULT)0x80040208:
        return "An attempt was made to modify parameters of an effect while it is playing.  Not all hardware devices support altering the parameters of an effect while it is playing. & Two pins of the same direction cannot be connected together.";
    case (HRESULT)0x80040209:
        return "The operation could not be completed because the device is not plugged in. & The operation cannot be performed because the pins are not connected.";
    case (HRESULT)0x8004020a:
        return "SendDeviceData failed because more information was requested to be sent than can be sent to the device.  Some devices have restrictions on how much data can be sent to them.  (For example, there might be a limit on the number of buttons that can be pressed at once.) & No sample buffer allocator is available.";
    case (HRESULT)0x8004020b:
        return "A mapper file function failed because reading or writing the user or IHV settings file failed. & A run-time error occurred.";
    case (HRESULT)0x8004020c:
        return "No buffer space has been set";
    case (HRESULT)0x8004020d:
        return "The buffer is not big enough.";
    case (HRESULT)0x8004020e:
        return "An invalid alignment was specified.";
    case (HRESULT)0x8004020f:
        return "Cannot change allocated memory while the filter is active.";
    case (HRESULT)0x80040210:
        return "One or more buffers are still active.";
    case (HRESULT)0x80040211:
        return "Cannot allocate a sample when the allocator is not active.";
    case (HRESULT)0x80040212:
        return "Cannot allocate memory because no size has been set.";
    case (HRESULT)0x80040213:
        return "Cannot lock for synchronization because no clock has been defined.";
    case (HRESULT)0x80040214:
        return "Quality messages could not be sent because no quality sink has been defined.";
    case (HRESULT)0x80040215:
        return "A required interface has not been implemented.";
    case (HRESULT)0x80040216:
        return "An object or name was not found.";
    case (HRESULT)0x80040217:
        return "No combination of intermediate filters could be found to make the connection.";
    case (HRESULT)0x80040218:
        return "No combination of filters could be found to render the stream.";
    case (HRESULT)0x80040219:
        return "Could not change formats dynamically.";
    case (HRESULT)0x8004021a:
        return "No color key has been set.";
    case (HRESULT)0x8004021b:
        return "Current pin connection is not using the IOverlay transport.";
    case (HRESULT)0x8004021c:
        return "Current pin connection is not using the IMemInputPin transport.";
    case (HRESULT)0x8004021d:
        return "Setting a color key would conflict with the palette already set.";
    case (HRESULT)0x8004021e:
        return "Setting a palette would conflict with the color key already set.";
    case (HRESULT)0x8004021f:
        return "No matching color key is available.";
    case (HRESULT)0x80040220:
        return "No palette is available.";
    case (HRESULT)0x80040221:
        return "Display does not use a palette.";
    case (HRESULT)0x80040222:
        return "Too many colors for the current display settings.";
    case (HRESULT)0x80040223:
        return "The state changed while waiting to process the sample.";
    case (HRESULT)0x80040224:
        return "The operation could not be performed because the filter is not stopped.";
    case (HRESULT)0x80040225:
        return "The operation could not be performed because the filter is not paused.";
    case (HRESULT)0x80040226:
        return "The operation could not be performed because the filter is not running.";
    case (HRESULT)0x80040227:
        return "The operation could not be performed because the filter is in the wrong state.";
    case (HRESULT)0x80040228:
        return "The sample start time is after the sample end time.";
    case (HRESULT)0x80040229:
        return "The supplied rectangle is invalid.";
    case (HRESULT)0x8004022a:
        return "This pin cannot use the supplied media type.";
    case (HRESULT)0x8004022b:
        return "This sample cannot be rendered.";
    case (HRESULT)0x8004022c:
        return "This sample cannot be rendered because the end of the stream has been reached.";
    case (HRESULT)0x8004022d:
        return "An attempt to add a filter with a duplicate name failed.";
    case (HRESULT)0x8004022e:
        return "A time-out has expired.";
    case (HRESULT)0x8004022f:
        return "The file format is invalid.";
    case (HRESULT)0x80040230:
        return "The list has already been exhausted.";
    case (HRESULT)0x80040231:
        return "The filter graph is circular.";
    case (HRESULT)0x80040232:
        return "Updates are not allowed in this state.";
    case (HRESULT)0x80040233:
        return "An attempt was made to queue a command for a time in the past.";
    case (HRESULT)0x80040234:
        return "The queued command has already been canceled.";
    case (HRESULT)0x80040235:
        return "Cannot render the file because it is corrupt.";
    case (HRESULT)0x80040236:
        return "An overlay advise link already exists.";
    case (HRESULT)0x80040238:
        return "No full-screen modes are available.";
    case (HRESULT)0x80040239:
        return "This Advise cannot be canceled because it was not successfully set.";
    case (HRESULT)0x8004023a:
        return "A full-screen mode is not available.";
    case (HRESULT)0x8004023b:
        return "Cannot call IVideoWindow methods while in full-screen mode.";
    case (HRESULT)0x80040240:
        return "The media type of this file is not recognized.";
    case (HRESULT)0x80040241:
        return "The source filter for this file could not be loaded.";
    case (HRESULT)0x80040243:
        return "A file appeared to be incomplete.";
    case (HRESULT)0x80040244:
        return "The version number of the file is invalid.";
    case (HRESULT)0x80040247:
        return "This file is corrupt: it contains an invalid class identifier.";
    case (HRESULT)0x80040248:
        return "This file is corrupt: it contains an invalid media type.";
    case (HRESULT)0x80040249:
        return "No time stamp has been set for this sample.";
    case (HRESULT)0x80040251:
        return "No media time stamp has been set for this sample.";
    case (HRESULT)0x80040252:
        return "No media time format has been selected.";
    case (HRESULT)0x80040253:
        return "Cannot change balance because audio device is mono only.";
    case (HRESULT)0x80040256:
        return "Cannot play back the audio stream: no audio hardware is available, or the hardware is not responding.";
    case (HRESULT)0x8004025b:
        return "ActiveMovie cannot play MPEG movies on this processor.";
    case (HRESULT)0x8004025c:
        return "Cannot play back the audio stream: the audio format is not supported.";
    case (HRESULT)0x8004025d:
        return "Cannot play back the video stream: the video format is not supported.";
    case (HRESULT)0x8004025e:
        return "ActiveMovie cannot play this video stream because it falls outside the constrained standard.";
    case (HRESULT)0x8004025f:
        return "Cannot perform the requested function on an object that is not in the filter graph.";
    case (HRESULT)0x80040261:
        return "Cannot get or set time related information on an object that is using a time format of TIME_FORMAT_NONE.";
    case (HRESULT)0x80040262:
        return "The connection cannot be made because the stream is read only and the filter alters the data.";
    case (HRESULT)0x80040264:
        return "The buffer is not full enough.";
    case (HRESULT)0x80040265:
        return "Cannot play back the file.  The format is not supported.";
    case (HRESULT)0x80040266:
        return "Pins cannot connect due to not supporting the same transport.";
    case (HRESULT)0x80040269:
        return "The Video CD can't be read correctly by the device or is the data is corrupt.";
    case (HRESULT)0x80040271:
        return "There is not enough Video Memory at this display resolution and number of colors. Reducing resolution might help.";
    case (HRESULT)0x80040272:
        return "The VideoPort connection negotiation process has failed.";
    case (HRESULT)0x80040273:
        return "Either DirectDraw has not been installed or the Video Card capabilities are not suitable. Make sure the display is not in 16 color mode.";
    case (HRESULT)0x80040274:
        return "No VideoPort hardware is available, or the hardware is not responding.";
    case (HRESULT)0x80040275:
        return "No Capture hardware is available, or the hardware is not responding.";
    case (HRESULT)0x80040276:
        return "This User Operation is inhibited by DVD Content at this time.";
    case (HRESULT)0x80040277:
        return "This Operation is not permitted in the current domain.";
    case (HRESULT)0x80040278:
        return "The specified button is invalid or is not present at the current time, or there is no button present at the specified location.";
    case (HRESULT)0x80040279:
        return "DVD-Video playback graph has not been built yet.";
    case (HRESULT)0x8004027a:
        return "DVD-Video playback graph building failed.";
    case (HRESULT)0x8004027b:
        return "DVD-Video playback graph could not be built due to insufficient decoders.";
    case (HRESULT)0x8004027c:
        return "Version number of DirectDraw not suitable. Make sure to install dx5 or higher version.";
    case (HRESULT)0x8004027d:
        return "Copy protection cannot be enabled. Please make sure any other copy protected content is not being shown now.";
    case (HRESULT)0x8004027f:
        return "This object cannot be used anymore as its time has expired.";
    case (HRESULT)0x80040281:
        return "The operation cannot be performed at the current playback speed.";
    case (HRESULT)0x80040282:
        return "The specified menu doesn't exist.";
    case (HRESULT)0x80040283:
        return "The specified command was either cancelled or no longer exists.";
    case (HRESULT)0x80040284:
        return "The data did not contain a recognized version.";
    case (HRESULT)0x80040285:
        return "The state data was corrupt.";
    case (HRESULT)0x80040286:
        return "The state data is from a different disc.";
    case (HRESULT)0x80040287:
        return "The region was not compatible with the current drive.";
    case (HRESULT)0x80040288:
        return "The requested DVD stream attribute does not exist.";
    case (HRESULT)0x80040289:
        return "Currently there is no GoUp (Annex J user function) program chain (PGC).";
    case (HRESULT)0x8004028a:
        return "The current parental level was too low.";
    case (HRESULT)0x8004028b:
        return "The current audio is not karaoke content.";
    case (HRESULT)0x8004028e:
        return "Frame step is not supported on this configuration.";
    case (HRESULT)0x8004028f:
        return "The specified stream is disabled and cannot be selected.";
    case (HRESULT)0x80040290:
        return "The operation depends on the current title number, however the navigator has not yet entered the VTSM or the title domains, so the 'current' title index is unknown.";
    case (HRESULT)0x80040291:
        return "The specified path does not point to a valid DVD disc.";
    case (HRESULT)0x80040292:
        return "There is currently no resume information.";
    case (HRESULT)0x80040293:
        return "This thread has already blocked this output pin.  There is no need to call IPinFlowControl::Block() again.";
    case (HRESULT)0x80040294:
        return "IPinFlowControl::Block() has been called on another thread.  The current thread cannot make any assumptions about this pin's block state.";
    case (HRESULT)0x80040295:
        return "An operation failed due to a certification failure.";
    case (HRESULT)0x80040300:
        return "Device driver-specific codes. Unless the specific driver has been precisely identified, no meaning should be attributed to these values other than that the driver originated the error.";
    case (HRESULT)0x80040304:
        return "DIERR_DRIVERFIRST+4";
    case (HRESULT)0x80040303:
        return "DIERR_DRIVERFIRST+3";
    case (HRESULT)0x80040302:
        return "DIERR_DRIVERFIRST+2";
    case (HRESULT)0x80040301:
        return "DIERR_DRIVERFIRST+1";
    case (HRESULT)0x80040305:
        return "DIERR_DRIVERFIRST+5";
    case (HRESULT)0x80040401:
        return "The user cancelled the install operation. & The stream already has allocated samples and the surface doesn't match the sample format.";
    case (HRESULT)0x80040400:
        return "Registry entry or DLL for class installer invalid or class installer not found.";
    case (HRESULT)0x800403ff:
        return "Device installer errors.";
    case (HRESULT)0x800403f2:
        return "A registry entry is corrupt.";
    case (HRESULT)0x80040402:
        return "The INF file for the selected device could not be found or is invalid or is damaged. & The specified purpose ID can't be used for the call.";
    case (HRESULT)0x80040403:
        return "No stream can be found with the specified attributes.";
    case (HRESULT)0x80040404:
        return "Seeking not supported for this object.";
    case (HRESULT)0x80040405:
        return "The stream formats are not compatible.";
    case (HRESULT)0x80040406:
        return "The sample is busy.";
    case (HRESULT)0x80040407:
        return "The object can't accept the call because its initialize function or equivalent has not been called.";
    case (HRESULT)0x80040408:
        return "MS_E_SOURCEALREADYDEFINED";
    case (HRESULT)0x80040409:
        return "The stream type is not valid for this operation.";
    case (HRESULT)0x8004040a:
        return "The object is not in running state.";
    case (HRESULT)0x8007000e:
        return "Ran out of memory";
    case (HRESULT)0x80070005:
        return "Access is denied";
    case (HRESULT)0x8007000c:
        return "The operation cannot be performed unless the device is acquired.";
    case (HRESULT)0x8007047e:
        return "The application requires a newer version of DirectInput.";
    case (HRESULT)0x80070103:
        return "No more items.";
    case (HRESULT)0x800700aa:
        return "The operation cannot be performed while the device is acquired.";
    case (HRESULT)0x80070077:
        return "The object could not be created due to an incompatible driver version or mismatched or incomplete driver components.";
    case (HRESULT)0x80070057:
        return "An invalid parameter was passed to the returning function";
    case (HRESULT)0x8007001e:
        return "Access to the device has been lost.  It must be re-acquired.";
    case (HRESULT)0x80070481:
        return "The application was written for an unsupported prerelease version of DirectInput.";
    case (HRESULT)0x8015004a:
    case (HRESULT)0x80158230:
        return "Exception";
    case (HRESULT)0x80070492:
        return "The specified property set is not supported.";
    case (HRESULT)0x80070490:
        return "The specified property ID is not supported for the specified property set.";
    case (HRESULT)0x80070006:
    case (HRESULT)0x80150096:
    case (HRESULT)0x80158360:
        return "Invalid handle";
    case (HRESULT)0x8015012c:
        return "Session lost";
    case (HRESULT)0x8015016a:
        return "Connected";
    case (HRESULT)0x80150169:
        return "Not initialized";
    case (HRESULT)0x8015012e:
        return "No voice session";
    case (HRESULT)0x8015016b:
        return "Not connected";
    case (HRESULT)0x80150171:
        return "Transport not host";
    case (HRESULT)0x80150170:
        return "Invalid target";
    case (HRESULT)0x8015016e:
        return "Connect aborting";
    case (HRESULT)0x80150172:
        return "Compression not supported";
    case (HRESULT)0x80150173:
        return "Already pending";
    case (HRESULT)0x80150174:
        return "Sound init failure";
    case (HRESULT)0x80150175:
        return "Time out";
    case (HRESULT)0x80150176:
        return "Connect aborted";
    case (HRESULT)0x80150177:
        return "No 3d sound";
    case (HRESULT)0x80150178:
        return "Already buffered";
    case (HRESULT)0x80150179:
        return "Not buffered";
    case (HRESULT)0x8015017b:
        return "Not hosting";
    case (HRESULT)0x8015017d:
        return "Record system error";
    case (HRESULT)0x8015017e:
        return "Playback system error";
    case (HRESULT)0x8015017f:
        return "Send error";
    case (HRESULT)0x80150183:
        return "Run setup";
    case (HRESULT)0x80150184:
        return "Incompatible version";
    case (HRESULT)0x80150187:
        return "Initialized";
    case (HRESULT)0x80150188:
        return "No transport";
    case (HRESULT)0x80150189:
        return "No callback";
    case (HRESULT)0x8015018a:
        return "Transport not init";
    case (HRESULT)0x8015018f:
        return "Invalid buffer";
    case (HRESULT)0x8015018e:
        return "No rec vol available";
    case (HRESULT)0x8015018d:
        return "User back";
    case (HRESULT)0x8015018c:
        return "Transport no player";
    case (HRESULT)0x8015018b:
        return "Transport no session";
    case (HRESULT)0x80150190:
        return "Locked buffer";
    case (HRESULT)0x80158060:
        return "Already connected";
    case (HRESULT)0x80158050:
        return "Already closing";
    case (HRESULT)0x80158040:
        return "Addressing";
    case (HRESULT)0x80158030:
        return "Aborted";
    case (HRESULT)0x80158070:
        return "Already disconnecting";
    case (HRESULT)0x80158110:
        return "Can not cancel";
    case (HRESULT)0x8015001e:
    case (HRESULT)0x80158100:
        return "Buffer too small";
    case (HRESULT)0x80158090:
        return "Already registered";
    case (HRESULT)0x80158080:
        return "Already initialized";
    case (HRESULT)0x80158120:
        return "Cant create group";
    case (HRESULT)0x80150168:
    case (HRESULT)0x80158160:
        return "Connection lost";
    case (HRESULT)0x80158150:
        return "Connecting";
    case (HRESULT)0x80158140:
        return "Cant launch application";
    case (HRESULT)0x80158130:
        return "Cant create player";
    case (HRESULT)0x80158170:
        return "Conversion";
    case (HRESULT)0x80158190:
        return "Duplicate command";
    case (HRESULT)0x80158185:
        return "dpnsvr not available";
    case (HRESULT)0x80158180:
        return "Does not exist";
    case (HRESULT)0x80158175:
        return "Data too large";
    case (HRESULT)0x80158200:
        return "End point not receiving";
    case (HRESULT)0x80158240:
        return "Group not empty";
    case (HRESULT)0x80158220:
        return "Enum response too large";
    case (HRESULT)0x80158210:
        return "Enum query too large";
    case (HRESULT)0x8015017a:
    case (HRESULT)0x80158250:
        return "Hosting";
    case (HRESULT)0x80158290:
        return "Invalid address format";
    case (HRESULT)0x80158280:
        return "Incomplete address";
    case (HRESULT)0x80158270:
        return "Host terminated session";
    case (HRESULT)0x80158260:
        return "Host rejected connection";
    case (HRESULT)0x80158300:
        return "Invalid application";
    case (HRESULT)0x80150078:
    case (HRESULT)0x80158340:
        return "Invalid flags";
    case (HRESULT)0x80158330:
        return "Invalid end point";
    case (HRESULT)0x80158320:
        return "Invalid device address";
    case (HRESULT)0x80158310:
        return "Invalid command";
    case (HRESULT)0x80150091:
    case (HRESULT)0x80158350:
        return "Invalid group";
    case (HRESULT)0x80150082:
    case (HRESULT)0x80158400:
        return "Invalid object";
    case (HRESULT)0x80158390:
        return "Invalid interface";
    case (HRESULT)0x80158380:
        return "Invalid instance";
    case (HRESULT)0x80158370:
        return "Invalid host address";
    case (HRESULT)0x80158410:
        return "Invalid password";
    case (HRESULT)0x80158450:
        return "Invalid url";
    case (HRESULT)0x80158440:
        return "Invalid string";
    case (HRESULT)0x80158430:
        return "Invalid priority";
    case (HRESULT)0x80150087:
    case (HRESULT)0x80158420:
        return "Invalid player";
    case (HRESULT)0x80158460:
        return "Invalid version";
    case (HRESULT)0x80158500:
        return "No more address components";
    case (HRESULT)0x80158490:
        return "No host player";
    case (HRESULT)0x80158480:
        return "No connection";
    case (HRESULT)0x80158470:
        return "No caps";
    case (HRESULT)0x80158510:
        return "No response";
    case (HRESULT)0x80158550:
        return "Not registered";
    case (HRESULT)0x80158540:
        return "Not ready";
    case (HRESULT)0x80158530:
        return "Not host";
    case (HRESULT)0x8015016f:
    case (HRESULT)0x80158520:
        return "Not allowed";
    case (HRESULT)0x80158560:
        return "Player already in group";
    case (HRESULT)0x80158600:
        return "Send too large";
    case (HRESULT)0x80158590:
        return "Player not reachable";
    case (HRESULT)0x80158580:
        return "Player not in group";
    case (HRESULT)0x80158570:
        return "Player lost";
    case (HRESULT)0x80158610:
        return "Session full";
    case (HRESULT)0x80150180:
    case (HRESULT)0x80158650:
        return "User cancel";
    case (HRESULT)0x80158640:
        return "Uninitialized";
    case (HRESULT)0x80158630:
        return "Timed out";
    case (HRESULT)0x80158620:
        return "Table full";
    case (HRESULT)0x88760037:
        return "An exception was encountered while performing the requested operation";
    case (HRESULT)0x88760028:
        return "Support is currently not available.";
    case (HRESULT)0x88760014:
        return "This surface can not be detached from the requested surface.";
    case (HRESULT)0x8876000a:
        return "This surface can not be attached to the requested surface.";
    case (HRESULT)0x8876005a:
        return "Height of rectangle provided is not a multiple of reqd alignment";
    case (HRESULT)0x88760078:
        return "DirectDraw does not support the requested mode";
    case (HRESULT)0x8876006e:
        return "DirectDraw does not support provided Cliplist.";
    case (HRESULT)0x88760064:
        return "One or more of the caps bits passed to the callback are incorrect.";
    case (HRESULT)0x8876005f:
        return "Unable to match primary surface creation request with existing primary surface.";
    case (HRESULT)0x88760082:
        return "DirectDraw received a pointer that was an invalid DIRECTDRAW object.";
    case (HRESULT)0x887600b4:
        return "Operation could not be carried out because there is no alpha accleration hardware present or available.";
    case (HRESULT)0x887600aa:
        return "There is no 3D present.";
    case (HRESULT)0x887600a0:
        return "Operation could not be carried out because one or more surfaces are locked";
    case (HRESULT)0x88760096:
        return "Rectangle provided was invalid.";
    case (HRESULT)0x88760091:
        return "pixel format was invalid as specified";
    case (HRESULT)0x887600b5:
        return "Operation could not be carried out because there is no stereo hardware present or available.";
    case (HRESULT)0x887600d4:
        return "Create function called without DirectDraw object method SetCooperativeLevel being called.";
    case (HRESULT)0x887600d2:
        return "Operation could not be carried out because there is no color conversion hardware present or available.";
    case (HRESULT)0x887600cd:
        return "no clip list available";
    case (HRESULT)0x887600b6:
        return "Operation could not be carried out because there is no hardware present which supports stereo surfaces";
    case (HRESULT)0x887600d7:
        return "Surface doesn't currently have a color key";
    case (HRESULT)0x887600e6:
        return "Flipping visible surfaces is not supported.";
    case (HRESULT)0x887600e1:
        return "Operation requires the application to have exclusive mode but the application does not have exclusive mode.";
    case (HRESULT)0x887600de:
        return "No DirectDraw support possible with current display driver";
    case (HRESULT)0x887600dc:
        return "Operation could not be carried out because there is no hardware support of the dest color key.";
    case (HRESULT)0x887600f0:
        return "There is no GDI present.";
    case (HRESULT)0x8876010e:
        return "Operation could not be carried out because the source and destination rectangles are on the same surface and overlap each other.";
    case (HRESULT)0x88760104:
        return "Operation could not be carried out because there is no overlay hardware present or available.";
    case (HRESULT)0x887600ff:
        return "Requested item was not found";
    case (HRESULT)0x887600fa:
        return "Operation could not be carried out because there is no hardware present or available.";
    case (HRESULT)0x88760118:
        return "Operation could not be carried out because there is no appropriate raster op hardware present or available.";
    case (HRESULT)0x8876013d:
        return "DirectDrawSurface is not in 4 bit color index palette and the requested operation requires 4 bit color index palette.";
    case (HRESULT)0x8876013c:
        return "DirectDrawSurface is not in 4 bit color palette and the requested operation requires 4 bit color palette.";
    case (HRESULT)0x88760136:
        return "Operation could not be carried out because there is no hardware support for stretching";
    case (HRESULT)0x88760122:
        return "Operation could not be carried out because there is no rotation hardware present or available.";
    case (HRESULT)0x88760140:
        return "DirectDraw Surface is not in 8 bit color mode and the requested operation requires 8 bit color.";
    case (HRESULT)0x8876015e:
        return "Overlay surfaces could not be z layered based on their BltOrder because the hardware does not support z layering of overlays.";
    case (HRESULT)0x88760154:
        return "Operation could not be carried out because there is no hardware support for zbuffer blting.";
    case (HRESULT)0x8876014f:
        return "Operation could not be carried out because there is no hardware support for vertical blank synchronized operations.";
    case (HRESULT)0x8876014a:
        return "Operation could not be carried out because there is no texture mapping hardware present or available.";
    case (HRESULT)0x88760168:
        return "The hardware needed for the requested operation has already been allocated.";
    case (HRESULT)0x88760183:
        return "Access to this palette is being refused because the palette is already locked by another thread.";
    case (HRESULT)0x88760180:
        return "Can only have ony color key active at one time for overlays";
    case (HRESULT)0x8876017e:
        return "hardware does not support clipped overlays";
    case (HRESULT)0x8876017c:
        return "Out of video memory";
    case (HRESULT)0x88760190:
        return "No src color key specified for this operation.";
    case (HRESULT)0x887601b3:
        return "Access to this surface is being refused because no driver exists which can supply a pointer to the surface. This is most likely to happen when attempting to lock the primary surface when no DCI provider is present. Will also happen on attempts to lock an optimized surface.";
    case (HRESULT)0x887601ae:
        return "Access to this surface is being refused because the surface is already locked by another thread.";
    case (HRESULT)0x887601a4:
        return "This surface is already a dependency of the surface it is being made a dependency of.";
    case (HRESULT)0x8876019a:
        return "This surface is already attached to the surface it is being attached to.";
    case (HRESULT)0x887601b8:
        return "Access to Surface refused because Surface is obscured.";
    case (HRESULT)0x887601c2:
        return "Access to this surface is being refused because the surface is gone. The DIRECTDRAWSURFACE object representing this surface should have Restore called on it.";
    case (HRESULT)0x887601cc:
        return "The requested surface is not attached.";
    case (HRESULT)0x887601d6:
        return "Height requested by DirectDraw is too large.";
    case (HRESULT)0x887601e0:
        return "Size requested by DirectDraw is too large --  The individual height and width are OK.";
    case (HRESULT)0x887601ea:
        return "Width requested by DirectDraw is too large.";
    case (HRESULT)0x887601fe:
        return "Pixel format requested is unsupported by DirectDraw";
    case (HRESULT)0x88760208:
        return "Bitmask in the pixel format requested is unsupported by DirectDraw";
    case (HRESULT)0x88760209:
        return "The specified stream contains invalid data";
    case (HRESULT)0x88760219:
        return "vertical blank is in progress";
    case (HRESULT)0x8876021c:
        return "Was still drawing";
    case (HRESULT)0x8876021e:
        return "The specified surface type requires specification of the COMPLEX flag";
    case (HRESULT)0x88760230:
        return "Rectangle provided was not horizontally aligned on reqd. boundary";
    case (HRESULT)0x88760231:
        return "The GUID passed to DirectDrawCreate is not a valid DirectDraw driver identifier.";
    case (HRESULT)0x88760232:
        return "A DirectDraw object representing this driver has already been created for this process.";
    case (HRESULT)0x88760233:
        return "A hardware only DirectDraw object creation was attempted but the driver did not support any hardware.";
    case (HRESULT)0x88760234:
        return "this process already has created a primary surface";
    case (HRESULT)0x88760235:
        return "software emulation not available.";
    case (HRESULT)0x88760236:
        return "region passed to Clipper::GetClipList is too small.";
    case (HRESULT)0x88760237:
        return "an attempt was made to set a clip list for a clipper objec that is already monitoring an hwnd.";
    case (HRESULT)0x88760238:
        return "No clipper object attached to surface object";
    case (HRESULT)0x88760239:
        return "Clipper notification requires an HWND or no HWND has previously been set as the CooperativeLevel HWND.";
    case (HRESULT)0x8876023a:
        return "HWND used by DirectDraw CooperativeLevel has been subclassed, this prevents DirectDraw from restoring state.";
    case (HRESULT)0x8876023b:
        return "The CooperativeLevel HWND has already been set. It can not be reset while the process has surfaces or palettes created.";
    case (HRESULT)0x8876023c:
        return "No palette object attached to this surface.";
    case (HRESULT)0x8876023d:
        return "No hardware support for 16 or 256 color palettes.";
    case (HRESULT)0x8876023e:
        return "If a clipper object is attached to the source surface passed into a BltFast call.";
    case (HRESULT)0x8876023f:
        return "No blter.";
    case (HRESULT)0x88760240:
        return "No DirectDraw ROP hardware.";
    case (HRESULT)0x88760241:
        return "returned when GetOverlayPosition is called on a hidden overlay";
    case (HRESULT)0x88760242:
        return "returned when GetOverlayPosition is called on a overlay that UpdateOverlay has never been called on to establish a destionation.";
    case (HRESULT)0x88760243:
        return "returned when the position of the overlay on the destionation is no longer legal for that destionation.";
    case (HRESULT)0x88760244:
        return "returned when an overlay member is called for a non-overlay surface";
    case (HRESULT)0x88760245:
        return "An attempt was made to set the cooperative level when it was already set to exclusive.";
    case (HRESULT)0x88760246:
        return "An attempt has been made to flip a surface that is not flippable.";
    case (HRESULT)0x88760247:
        return "Can't duplicate primary & 3D surfaces, or surfaces that are implicitly created.";
    case (HRESULT)0x88760248:
        return "Surface was not locked.  An attempt to unlock a surface that was not locked at all, or by this process, has been attempted.";
    case (HRESULT)0x88760249:
        return "Windows can not create any more DCs, or a DC was requested for a paltte-indexed surface when the surface had no palette AND the display mode was not palette-indexed (in this case DirectDraw cannot select a proper palette into the DC)";
    case (HRESULT)0x8876024a:
        return "No DC was ever created for this surface.";
    case (HRESULT)0x8876024b:
        return "This surface can not be restored because it was created in a different mode.";
    case (HRESULT)0x8876024c:
        return "This surface can not be restored because it is an implicitly created surface.";
    case (HRESULT)0x8876024d:
        return "The surface being used is not a palette-based surface";
    case (HRESULT)0x88760259:
        return "Surface is an optimized surface, but has not yet been allocated any memory";
    case (HRESULT)0x88760258:
        return "Device does not support optimized surfaces, therefore no video memory optimized surfaces";
    case (HRESULT)0x88760250:
        return "The requested action could not be performed because the surface was of the wrong type.";
    case (HRESULT)0x8876024f:
        return "Operation could not be carried out because there is no mip-map texture mapping hardware present or available.";
    case (HRESULT)0x8876024e:
        return "The display is currently in an unsupported mode";
    case (HRESULT)0x8876025a:
        return "Attempt was made to create or set a device window without first setting the focus window";
    case (HRESULT)0x88760280:
        return "The attempt to page lock a surface failed.";
    case (HRESULT)0x88760276:
        return "An attempt was made to allocate non-local video memory from a device that does not support non-local video memory.";
    case (HRESULT)0x8876026c:
        return "A DC has already been returned for this surface. Only one DC can be retrieved per surface.";
    case (HRESULT)0x8876025b:
        return "Attempt was made to set a palette on a mipmap sublevel";
    case (HRESULT)0x88760294:
        return "The attempt to page unlock a surface failed.";
    case (HRESULT)0x887602a8:
        return "An attempt was made to page unlock a surface with no outstanding page locks.";
    case (HRESULT)0x887602b2:
        return "There is more data available than the specified buffer size could hold";
    case (HRESULT)0x887602b3:
        return "The data has expired and is therefore no longer valid.";
    case (HRESULT)0x887602b4:
        return "The mode test has finished executing.";
    case (HRESULT)0x887602b5:
        return "The mode test has switched to a new mode.";
    case (HRESULT)0x887602b6:
        return "D3D has not yet been initialized.";
    case (HRESULT)0x887602b7:
        return "The video port is not active";
    case (HRESULT)0x887602b8:
        return "The monitor does not have EDID data.";
    case (HRESULT)0x887602b9:
        return "The driver does not enumerate display mode refresh rates.";
    case (HRESULT)0x887602bb:
        return "Surfaces created by one direct draw device cannot be used directly by another direct draw device.";
    case (HRESULT)0x88760366:
        return "Internal error";
    case (HRESULT)0x88760368:
        return "Bad intrinsics";
    case (HRESULT)0x88760369:
        return "No more stream handles";
    case (HRESULT)0x8876036c:
        return "No internet";
    case (HRESULT)0x88760384:
        return "Bad object";
    case (HRESULT)0x88760385:
        return "Bad value";
    case (HRESULT)0x88760386:
        return "Bad type";
    case (HRESULT)0x88760388:
        return "Not done yet";
    case (HRESULT)0x88760389:
        return "File not found";
    case (HRESULT)0x8876038a:
        return "Resource not found";
    case (HRESULT)0x8876038b:
        return "Bad resource";
    case (HRESULT)0x8876038c:
        return "Bad file type";
    case (HRESULT)0x8876038d:
        return "Bad file version";
    case (HRESULT)0x8876038e:
        return "Bad file float size";
    case (HRESULT)0x88760367:
    case (HRESULT)0x88760393:
        return "No more objects";
    case (HRESULT)0x88760365:
    case (HRESULT)0x88760392:
        return "Bad data reference";
    case (HRESULT)0x88760364:
    case (HRESULT)0x88760391:
        return "Bad array size";
    case (HRESULT)0x88760390:
        return "Parse error";
    case (HRESULT)0x8876038f:
        return "Bad file";
    case (HRESULT)0x8876036a:
    case (HRESULT)0x88760394:
        return "No more data";
    case (HRESULT)0x8876081a:
        return "Unsupported color arg";
    case (HRESULT)0x88760819:
        return "Unsupported color operation";
    case (HRESULT)0x88760818:
        return "Wrong texture format";
    case (HRESULT)0x8876036b:
    case (HRESULT)0x88760395:
        return "Bad cache file";
    case (HRESULT)0x8876081b:
        return "Unsupported alpha operation";
    case (HRESULT)0x8876081f:
        return "Unsupported factor value";
    case (HRESULT)0x8876081e:
        return "Conflicting texture filter";
    case (HRESULT)0x8876081d:
        return "Too many operations";
    case (HRESULT)0x8876081c:
        return "Unsupported alpha arg";
    case (HRESULT)0x88760821:
        return "Conflicting render state";
    case (HRESULT)0x88760387:
    case (HRESULT)0x88760866:
        return "Not found";
    case (HRESULT)0x88760827:
        return "Driver internal error";
    case (HRESULT)0x88760826:
        return "Conflicting texture palette";
    case (HRESULT)0x88760822:
        return "Unsupported texture filter";
    case (HRESULT)0x88760867:
        return "More data";
    case (HRESULT)0x8015017c:
    case (HRESULT)0x8876086b:
        return "Invalid device";
    case (HRESULT)0x8876086a:
        return "Not available";
    case (HRESULT)0x88760869:
        return "Device not reset";
    case (HRESULT)0x88760868:
        return "Device lost";
    case (HRESULT)0x8876086c:
        return "Invalid call";
    case (HRESULT)0x88760b56:
        return "Cannot attr sort";
    case (HRESULT)0x88760b55:
        return "Invalid mesh";
    case (HRESULT)0x88760b54:
        return "Can not modify index buffer";
    case (HRESULT)0x8876086d:
        return "Driver invalid call";
    case (HRESULT)0x88760b57:
        return "Skinning not supported";
    case (HRESULT)0x88760b5b:
        return "Duplicate named fragment";
    case (HRESULT)0x88760b5a:
        return "Loaded mesh has no data";
    case (HRESULT)0x88760b59:
        return "Invalid data";
    case (HRESULT)0x88760b58:
        return "Too many influences";
    case (HRESULT)0x88760b5c:
        return "Can Not remove last item";
    case (HRESULT)0x88780046:
        return "The caller does not have the priority level required for the function to succeed";
    case (HRESULT)0x88780032:
        return "This call is not valid for the current state of this object";
    case (HRESULT)0x8878001e:
        return "The control (vol, pan, etc.) requested by the caller is not available";
    case (HRESULT)0x8878000a:
        return "The call failed because resources (such as a priority level) were already being used by another caller";
    case (HRESULT)0x88780064:
        return "The specified WAVE format is not supported";
    case (HRESULT)0x80070015:
    case (HRESULT)0x887800aa:
        return "This object has not been initialized";
    case (HRESULT)0x887800a0:
        return "Another app has a higher priority level, preventing this call from succeeding";
    case (HRESULT)0x88780096:
        return "The buffer memory has been lost, and must be restored";
    case (HRESULT)0x800704df:
    case (HRESULT)0x88760005:
    case (HRESULT)0x88780082:
        return "This object is already initialized";
    case (HRESULT)0x88780078:
        return "No sound driver is available for use";
    case (HRESULT)0x887800b4:
        return "Tried to create a DSBCAPS_CTRLFX buffer shorter than DSBSIZE_FX_MIN milliseconds";
    case (HRESULT)0x88781101:
        return "An unexpected error was returned from a device driver, indicating possible failure of the driver or hardware.";
    case (HRESULT)0x887800d2:
        return "The GUID specified in an audiopath file does not match a valid MIXIN buffer";
    case (HRESULT)0x887800c8:
        return "A circular loop of send effects was detected";
    case (HRESULT)0x887800be:
        return "Attempt to use DirectSound 8 functionality on an older DirectSound object";
    case (HRESULT)0x88781102:
        return "The requested operation cannot be performed while there are  instantiated ports in any process in the system.";
    case (HRESULT)0x88781103:
        return "The requested device is already in use (possibly by a non-DirectMusic client) and cannot be opened again.";
    case (HRESULT)0x88781104:
        return "Buffer is not large enough for requested operation.";
    case (HRESULT)0x88781105:
        return "No buffer was prepared for the download data.";
    case (HRESULT)0x88781106:
        return "Download failed due to inability to access or create download buffer.";
    case (HRESULT)0x88781108:
        return "Error parsing DLS collection. File is corrupt.";
    case (HRESULT)0x88781109:
        return "Wave chunks in DLS collection file are at incorrect offsets.";
    case (HRESULT)0x88781111:
        return "Second attempt to load a DLS collection that is currently open. ";
    case (HRESULT)0x88781113:
        return "Error reading wave data from DLS collection. Indicates bad file.";
    case (HRESULT)0x88781114:
        return "There is no instrument in the collection that matches patch number.";
    case (HRESULT)0x88781115:
        return "The IStream* doesn't support Seek().";
    case (HRESULT)0x88781116:
        return "The IStream* doesn't support Write().";
    case (HRESULT)0x88781117:
        return "The RIFF parser doesn't contain a required chunk while parsing file.";
    case (HRESULT)0x88781119:
        return "Invalid download id was used in the process of creating a download buffer.";
    case (HRESULT)0x88781120:
        return "Tried to unload an object that was not downloaded or previously unloaded.";
    case (HRESULT)0x88781121:
        return "Buffer was already downloaded to synth.";
    case (HRESULT)0x88781122:
        return "The specified property item was not recognized by the target object.";
    case (HRESULT)0x88781123:
        return "The specified property item may not be set on the target object.";
    case (HRESULT)0x88781124:
        return "* The specified property item may not be retrieved from the target object.";
    case (HRESULT)0x88781125:
        return "Wave chunk has more than one interleaved channel. DLS format requires MONO.";
    case (HRESULT)0x88781126:
        return "Invalid articulation chunk in DLS collection.";
    case (HRESULT)0x88781127:
        return "Invalid instrument chunk in DLS collection.";
    case (HRESULT)0x88781128:
        return "Wavelink chunk in DLS collection points to invalid wave.";
    case (HRESULT)0x88781129:
        return "Articulation missing from instrument in DLS collection.";
    case (HRESULT)0x8878112a:
        return "Downoaded DLS wave is not in PCM format. ";
    case (HRESULT)0x8878112b:
        return "Bad wave chunk in DLS collection";
    case (HRESULT)0x8878112c:
        return "Offset Table for download buffer has errors. ";
    case (HRESULT)0x8878112d:
        return "Attempted to download unknown data type.";
    case (HRESULT)0x8878112e:
        return "The operation could not be completed because no sink was connected to the synthesizer.";
    case (HRESULT)0x8878112f:
        return "An attempt was made to open the software synthesizer while it was already  open.";
    case (HRESULT)0x88781130:
        return "An attempt was made to close the software synthesizer while it was already  open.";
    case (HRESULT)0x88781161:
        return "The object requested was not found (numerically equal to DMUS_E_NOT_FOUND)";
    case (HRESULT)0x88781131:
        return "The operation could not be completed because the software synth has not  yet been fully configured.";
    case (HRESULT)0x88781132:
        return "The operation cannot be carried out while the synthesizer is active.";
    case (HRESULT)0x88781133:
        return "An error occurred while attempting to read from the IStream* object.";
    case (HRESULT)0x88781134:
        return "The operation cannot be performed because the final instance of the DirectMusic object was released. Ports cannot be used after final  release of the DirectMusic object.";
    case (HRESULT)0x88781135:
        return "There was no data in the referenced buffer.";
    case (HRESULT)0x88781136:
        return "There is insufficient space to insert the given event into the buffer.";
    case (HRESULT)0x88781137:
        return "The given operation could not be carried out because the port is a capture port.";
    case (HRESULT)0x88781138:
        return "The given operation could not be carried out because the port is a render port.";
    case (HRESULT)0x88781139:
        return "The port could not be created because no DirectSound has been specified. Specify a DirectSound interface via the IDirectMusic::SetDirectSound method; pass NULL to have DirectMusic manage usage of DirectSound.";
    case (HRESULT)0x8878113a:
        return "The operation cannot be carried out while the port is active.";
    case (HRESULT)0x8878113b:
        return "Invalid DirectSound buffer was handed to port. ";
    case (HRESULT)0x8878113c:
        return "Invalid buffer format was handed to the synth sink.";
    case (HRESULT)0x8878113d:
        return "The operation cannot be carried out while the synthesizer is inactive.";
    case (HRESULT)0x8878113e:
        return "IDirectMusic::SetDirectSound has already been called. It may not be changed while in use.";
    case (HRESULT)0x8878113f:
        return "The given event is invalid (either it is not a valid MIDI message or it makes use of running status). The event cannot be packed into the buffer.";
    case (HRESULT)0x88781150:
        return "The IStream* object does not contain data supported by the loading object.";
    case (HRESULT)0x88781151:
        return "The object has already been initialized.";
    case (HRESULT)0x88781152:
        return "The file does not contain a valid band.";
    case (HRESULT)0x88781155:
        return "The IStream* object's data does not have a track header as the first chunk, and therefore can not be read by the segment object.";
    case (HRESULT)0x88781156:
        return "The IStream* object's data does not have a tool header as the first chunk, and therefore can not be read by the graph object.";
    case (HRESULT)0x88781157:
        return "The IStream* object's data contains an invalid track header (ckid is 0 and fccType is NULL,) and therefore can not be read by the segment object.";
    case (HRESULT)0x88781158:
        return "The IStream* object's data contains an invalid tool header (ckid is 0 and fccType is NULL,) and therefore can not be read by the graph object.";
    case (HRESULT)0x88781159:
        return "The graph object was unable to load all tools from the IStream* object data. This may be due to errors in the stream, or the tools being incorrectly registered on the client.";
    case (HRESULT)0x88781160:
        return "The segment object was unable to load all tracks from the IStream* object data. This may be due to errors in the stream, or the tracks being incorrectly registered on the client.";
    case (HRESULT)0x88781162:
        return "A required object is not initialized or failed to initialize.";
    case (HRESULT)0x88781163:
        return "The requested parameter type is currently disabled. Parameter types may be enabled and disabled by certain calls to SetParam().";
    case (HRESULT)0x88781164:
        return "The requested parameter type is not supported on the object.";
    case (HRESULT)0x88781165:
        return "The time is in the past, and the operation can not succeed.";
    case (HRESULT)0x88781166:
        return "The requested track is not contained by the segment.";
    case (HRESULT)0x88781167:
        return "The track does not support clock time playback or getparam.";
    case (HRESULT)0x88781170:
        return "There is no master clock in the performance. Be sure to call IDirectMusicPerformance::Init().";
    case (HRESULT)0x88781183:
        return "Search data type is not supported.";
    case (HRESULT)0x88781182:
        return "File open failed - either file doesn't exist or is locked.";
    case (HRESULT)0x88781181:
        return "The requested file path is invalid.";
    case (HRESULT)0x88781180:
        return "The class id field is required and missing in the DMUS_OBJECTDESC.";
    case (HRESULT)0x88781184:
        return "Unable to find or create object.";
    case (HRESULT)0x88781200:
        return "The file requested is not a valid file.";
    case (HRESULT)0x88781186:
        return "The file name is missing from the DMUS_OBJECTDESC.";
    case (HRESULT)0x88781185:
        return "Object was not found.";
    case (HRESULT)0x88781201:
        return "The tool is already contained in the graph. Create a new instance.";
    case (HRESULT)0x88781210:
        return "DMUS_E_DESCEND_CHUNK_FAIL is returned when the end of the file  was reached before the desired chunk was found.";
    case (HRESULT)0x88781207:
        return "A call to MIDIToMusic() or MusicToMIDI() resulted in an error because the requested conversion could not happen. This usually occurs when the provided DMUS_CHORD_KEY structure has an invalid chord or scale pattern.";
    case (HRESULT)0x88781206:
        return "The default system port could not be opened.";
    case (HRESULT)0x88781205:
        return "The DMUS_PMSG was either not allocated by the performance via IDirectMusicPerformance::AllocPMsg(), or it was already freed via IDirectMusicPerformance::FreePMsg().";
    case (HRESULT)0x88781204:
        return "The DMUS_PMSG has already been sent to the performance object via IDirectMusicPerformance::SendPMsg().";
    case (HRESULT)0x88781203:
        return "Segment initialization failed, most likely due to a critical memory situation.";
    case (HRESULT)0x88781202:
        return "Value is out of range, for instance the requested length is longer than the segment.";
    case (HRESULT)0x88781211:
        return "An attempt to use this object failed because it first needs to be loaded.";
    case (HRESULT)0x88781213:
        return "The activeX scripting engine for the script's language is not compatible with DirectMusic.";
    case (HRESULT)0x88781214:
        return "A varient was used that had a type that is not supported by DirectMusic.";
    case (HRESULT)0x88781215:
        return "An error was encountered while parsing or executing the script. The pErrorInfo parameter (if supplied) was filled with information about the error.";
    case (HRESULT)0x88781216:
        return "Loading of oleaut32.dll failed.  VBScript and other activeX scripting languages require use of oleaut32.dll.  On platforms where oleaut32.dll is not present, only the DirectMusicScript language, which doesn't require oleaut32.dll can be used.";
    case (HRESULT)0x88781217:
        return "An error occured while parsing a script loaded using LoadScript.  The script that was loaded contains an error.";
    case (HRESULT)0x88781218:
        return "The script file is invalid.";
    case (HRESULT)0x88781219:
        return "The file contains an invalid script track.";
    case (HRESULT)0x8878121a:
        return "The script does not contain a variable with the specified name.";
    case (HRESULT)0x8878121b:
        return "The script does not contain a routine with the specified name.";
    case (HRESULT)0x8878121c:
        return "Scripts variables for content referenced or embedded in a script cannot be set.";
    case (HRESULT)0x8878121d:
        return "Attempt was made to set a script's variable by reference to a value that was not an object type.";
    case (HRESULT)0x8878121e:
        return "Attempt was made to set a script's variable by value to an object that does not support a default value property.";
    case (HRESULT)0x88781220:
        return "The file contains an invalid segment trigger track.";
    case (HRESULT)0x88781221:
        return "The file contains an invalid lyrics track.";
    case (HRESULT)0x88781222:
        return "The file contains an invalid parameter control track.";
    case (HRESULT)0x88781223:
        return "A script written in AudioVBScript could not be read because it contained a statement that is not allowed by the AudioVBScript language.";
    case (HRESULT)0x88781224:
        return "A script routine written in AudioVBScript failed because an invalid operation occurred.  For example, adding the number 3 to a segment object would produce this error.  So would attempting to call a routine that doesn't exist.";
    case (HRESULT)0x88781225:
        return "A script routine written in AudioVBScript failed because a function outside of a script failed to complete. For example, a call to PlaySegment that fails to play because of low memory would return this error.";
    case (HRESULT)0x88781226:
        return "The Performance has set up some PChannels using the AssignPChannel command, which makes it not capable of supporting audio paths.";
    case (HRESULT)0x88781227:
        return "This is the inverse of the previous error. The Performance has set up some audio paths, which makes is incompatible with the calls to allocate pchannels, etc. ";
    case (HRESULT)0x88781228:
        return "A segment or song was asked for its embedded audio path configuration, but there isn't any. ";
    case (HRESULT)0x88781229:
        return "An audiopath is inactive, perhaps because closedown was called.";
    case (HRESULT)0x8878122a:
        return "An audiopath failed to create because a requested buffer could not be created.";
    case (HRESULT)0x8878122b:
        return "An audiopath could not be used for playback because it lacked port assignments.";
    case (HRESULT)0x8878122c:
        return "Attempt was made to play segment in audiopath mode and there was no audiopath.";
    case (HRESULT)0x8878122d:
        return "Invalid data was found in a RIFF file chunk.";
    case (HRESULT)0x8878122e:
        return "Attempt was made to create an audiopath that sends to a global effects buffer which did not exist.";
    case (HRESULT)0x8878122f:
        return "The file does not contain a valid container object.";
    case (HRESULT)0xc8770bb8:
        return "Out of memory";
    case (HRESULT)0xc8770bb9:
        return "A NULL pointer was passed as a parameter";
    case (HRESULT)0xc8770bba:
        return "The Device Index passed in is invalid";
    case (HRESULT)0xc8770bbb:
        return "DirectDraw has not been created";
    case (HRESULT)0xc8770bbc:
        return "Direct3D has not been created";
    case (HRESULT)0xc8770bbd:
        return "Direct3D device has not been created";
    case (HRESULT)0xc8770bbe:
        return "Primary surface has not been created";
    case (HRESULT)0xc8770bbf:
        return "Z buffer has not been created";
    case (HRESULT)0xc8770bc0:
        return "Backbuffer has not been created";
    case (HRESULT)0xc8770bc1:
        return "Failed to update caps database after changing display mode";
    case (HRESULT)0xc8770bc2:
        return "Could not create Z buffer";
    case (HRESULT)0xc8770bc3:
        return "Display mode is not valid";
    case (HRESULT)0xc8770bc4:
        return "One or more of the parameters passed is invalid";
    case (HRESULT)0xc8770bc5:
        return "D3DX failed to initialize itself";
    case (HRESULT)0xc8770bc6:
        return "D3DX failed to start up";
    case (HRESULT)0xc8770bc7:
        return "D3DXInitialize() must be called first";
    case (HRESULT)0xc8770bc8:
        return "D3DX is not initialized yet";
    case (HRESULT)0xc8770bc9:
        return "Failed to render text to the surface";
    case (HRESULT)0xc8770bca:
        return "Bad D3DX context";
    case (HRESULT)0xc8770bcb:
        return "The requested device capabilities are not supported";
    case (HRESULT)0xc8770bcc:
        return "The image file format is unrecognized";
    case (HRESULT)0xc8770bcd:
        return "The image file loading library error";
    case (HRESULT)0xc8770bce:
        return "Could not obtain device caps";
    case (HRESULT)0xc8770bcf:
        return "Resize does not work for full-screen";
    case (HRESULT)0xc8770bd0:
        return "Resize does not work for non-windowed contexts";
    case (HRESULT)0xc8770bd1:
        return "Front buffer already exists";
    case (HRESULT)0xc8770bd2:
        return "The app is using the primary in full-screen mode";
    case (HRESULT)0xc8770bd3:
        return "Could not get device context";
    case (HRESULT)0xc8770bd4:
        return "Could not bitBlt";
    case (HRESULT)0xc8770bd5:
        return "There is no surface backing up this texture";
    case (HRESULT)0xc8770bd6:
        return "There is no such miplevel for this surface";
    case (HRESULT)0xc8770bd7:
        return "The surface is not paletted";
    case (HRESULT)0xc8770bd8:
        return "An error occured while enumerating surface formats";
    case (HRESULT)0xc8770bd9:
        return "D3DX only supports color depths of 16 bit or greater";
    case (HRESULT)0xc8770bda:
        return "The file format is invalid";
    case (HRESULT)0xc8770bdb:
        return "No suitable match found";
    case (HRESULT)0x00000000:
        return "The function completed successfully";
    case (HRESULT)0x00000001:
        return "Call successful, but returned FALSE";
    case (HRESULT)0x00000002:
    case (HRESULT)0x80070002:
        return "The system cannot find the file specified.";
    case (HRESULT)0x00000003:
    case (HRESULT)0x80070003:
        return "The system cannot find the path specified.";
    case (HRESULT)0x00000004:
    case (HRESULT)0x80070004:
        return "The system cannot open the file.";
    case (HRESULT)0x00000005:
        return "Access is denied.";
    case (HRESULT)0x00000006:
        return "The handle is invalid.";
    case (HRESULT)0x00000008:
    case (HRESULT)0x80070008:
        return "Not enough storage is available to process this command.";
    case (HRESULT)0x00000009:
    case (HRESULT)0x80070009:
        return "The storage control block address is invalid.";
    case (HRESULT)0x0000000a:
    case (HRESULT)0x8007000a:
        return "The environment is incorrect.";
    case (HRESULT)0x0000000b:
    case (HRESULT)0x8007000b:
        return "An attempt was made to load a program with an incorrect format.";
    case (HRESULT)0x0000000e:
        return "The system cannot find the drive specified.";
    case (HRESULT)0x00040003:
        return "End of stream. Sample not updated.";
    case (HRESULT)0x00040242:
        return "Some of the streams in this movie are in an unsupported format.";
    case (HRESULT)0x00040237:
        return "The state transition has not completed.";
    case (HRESULT)0x0004022d:
        return "An attempt to add a filter with a duplicate name succeeded with a modified name.";
    case (HRESULT)0x00040103:
        return "The end of the list has been reached.";
    case (HRESULT)0x00040245:
        return "The file contained some property settings that were not used.";
    case (HRESULT)0x00040257:
    case (HRESULT)0x80040255:
        return "Cannot play back the video stream: no suitable decompressor could be found.";
    case (HRESULT)0x00040254:
        return "A connection could not be made with the media type in the persistent graph, but has been made with a negotiated media type.";
    case (HRESULT)0x00040250:
        return "The resource specified is no longer needed.";
    case (HRESULT)0x00040246:
        return "Some connections have failed and have been deferred.";
    case (HRESULT)0x00040258:
        return "Cannot play back the audio stream: no audio hardware is available.";
    case (HRESULT)0x00040267:
        return "The stream has been turned off.";
    case (HRESULT)0x00040263:
        return "This success code is reserved for internal purposes within ActiveMovie.";
    case (HRESULT)0x00040260:
        return "The value returned had to be estimated.  It's accuracy can not be guaranteed.";
    case (HRESULT)0x0004025a:
    case (HRESULT)0x80040259:
        return "Cannot play back the video stream: format 'RPZA' is not supported.";
    case (HRESULT)0x00040268:
        return "The graph can't be cued because of lack of or corrupt data.";
    case (HRESULT)0x00040280:
        return "The current title was not a sequential set of chapters (PGC), and the returned timing information might not be continuous.";
    case (HRESULT)0x0004027e:
        return "There was no preview pin available, so the capture pin output is being split to provide both capture and preview.";
    case (HRESULT)0x00040270:
        return "The stop time for the sample was not set.";
    case (HRESULT)0x0004028c:
        return "The audio stream did not contain sufficient information to determine the contents of each channel.";
    case (HRESULT)0x00150010:
        return "Pending";
    case (HRESULT)0x0015000a:
        return "Half duplex";
    case (HRESULT)0x00150005:
        return "Full duplex";
    case (HRESULT)0x0004028d:
        return "The seek into the movie was not frame accurate.";
    case (HRESULT)0x0876086f:
        return "The call succeeded but there won't be any mipmaps generated";
    case (HRESULT)0x08781200:
        return "Return value from IDirectMusicTool::ProcessPMsg() which indicates to the performance that it should cue the PMsg again automatically.";
    case (HRESULT)0x08781092:
        return "Return value from IDirectMusicBand::Download() which indicates that some of the instruments safely downloaded, but others failed. This usually occurs when some instruments are on PChannels not supported by the performance or port.";
    case (HRESULT)0x08781091:
        return "The object could only load partially. This can happen if some components are not registered properly, such as embedded tracks and tools. This can also happen if some content is missing. For example, if a segment uses a DLS collection that is not in the loader's current search directory.";
    case (HRESULT)0x0878000a:
        return "The call succeeded, but we had to substitute the 3D algorithm";
    case (HRESULT)0x08781201:
        return "Return value from IDirectMusicTool::ProcessPMsg() which indicates to the performance that it should free the PMsg automatically.";
    case (HRESULT)0x08781212:
        return "Returned from IDirectMusicPerformance::MusicToMIDI(), this indicates  that no note has been calculated because the music value has the note  at a position higher than the top note of the chord. This applies only to DMUS_PLAYMODE_NORMALCHORD play mode. This success code indicates that the caller should not do anything with the note. It is not meant to be played against this chord.";
    case (HRESULT)0x08781211:
        return "Returned from IDirectMusicGraph::StampPMsg(), this indicates that the PMsg is already stamped with the last tool in the graph. The returned PMsg's tool pointer is now NULL.";
    case (HRESULT)0x08781210:
        return "Returned string has been truncated to fit the buffer size.";
    case (HRESULT)0x08781202:
        return "Return value from IDirectMusicTrack::Play() which indicates to the segment that the track has no more data after mtEnd.";
    case (HRESULT)0x08781213:
        return "Returned from IDirectMusicPerformance::MIDIToMusic(),  and IDirectMusicPerformance::MusicToMIDI(), this indicates  that the note conversion generated a note value that is below 0,  so it has been bumped up one or more octaves to be in the proper MIDI range of 0 through 127.  Note that this is valid for MIDIToMusic() when using play modes DMUS_PLAYMODE_FIXEDTOCHORD and DMUS_PLAYMODE_FIXEDTOKEY, both of which store MIDI values in wMusicValue. With MusicToMIDI(), it is valid for all play modes. Ofcourse, DMUS_PLAYMODE_FIXED will never return this success code.";
    case (HRESULT)0x08781216:
        return "The requested operation was not performed because during CollectGarbage the loader determined that the object had been released.";
    case (HRESULT)0x08781215:
        return "Although the audio output from the port will be routed to the same device as the given DirectSound buffer, buffer controls such as pan and volume will not affect the output.";
    case (HRESULT)0x08781214:
        return "Returned from IDirectMusicPerformance::MIDIToMusic(),  and IDirectMusicPerformance::MusicToMIDI(), this indicates  that the note conversion generated a note value that is above 127, so it has been bumped down one or more octaves to be in the proper MIDI range of 0 through 127.  Note that this is valid for MIDIToMusic() when using play modes DMUS_PLAYMODE_FIXEDTOCHORD and DMUS_PLAYMODE_FIXEDTOKEY, both of which store MIDI values in wMusicValue. With MusicToMIDI(), it is valid for all play modes. Ofcourse, DMUS_PLAYMODE_FIXED will never return this success code.";
    default:
        return "n/a";
    }
}
