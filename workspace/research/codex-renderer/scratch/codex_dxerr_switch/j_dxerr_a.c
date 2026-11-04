#include <stddef.h>
const char *__stdcall Renderer_ErrorDescription(int code)
{
    switch (code)
    {
    case -2147483638:
        return "The data necessary to complete this operation is not yet available.";
    case -2147467263:
        return "The function called is not supported at this time";
    case -2147467262:
        return "The requested COM interface is not available";
    case -2147467261:
        return "Invalid pointer";
    case -2147467260:
        return "Operation aborted";
    case -2147467259:
        return "An undetermined error occurred";
    case -2147418113:
        return "Catastrophic failure";
    case -2147221232:
        return "This object does not support aggregation";
    case -2147221164:
        return "Class not registered";
    case -2147221008:
        return "CoInitialize has not been called.";
    case -2147221007:
        return "CoInitialize has already been called.";
    case -2147220992:
        return "Unable to IDirectInputJoyConfig_Acquire because the user does not have sufficient privileges to change the joystick configuration. & An invalid media type was specified";
    case -2147220991:
        return "The device is full. & An invalid media subtype was specified.";
    case -2147220990:
        return "Not all the requested information fit into the buffer. & This object can only be created as an aggregated object.";
    case -2147220989:
        return "The effect is not downloaded. & The enumerator has become invalid.";
    case -2147220988:
        return "The device cannot be reinitialized because there are still effects attached to it. & At least one of the pins involved in the operation is already connected.";
    case -2147220987:
        return "The operation cannot be performed unless the device is acquired in DISCL_EXCLUSIVE mode. & This operation cannot be performed because the filter is active.";
    case -2147220986:
        return "The effect could not be downloaded because essential information is missing.  For example, no axes have been associated with the effect, or no type-specific information has been created. & One of the specified pins supports no media types.";
    case -2147220985:
        return "Attempted to read buffered device data from a device that is not buffered. & There is no common media type between these pins.";
    case -2147220984:
        return "An attempt was made to modify parameters of an effect while it is playing.  Not all hardware devices support altering the parameters of an effect while it is playing. & Two pins of the same direction cannot be connected together.";
    case -2147220983:
        return "The operation could not be completed because the device is not plugged in. & The operation cannot be performed because the pins are not connected.";
    case -2147220982:
        return "SendDeviceData failed because more information was requested to be sent than can be sent to the device.  Some devices have restrictions on how much data can be sent to them.  (For example, there might be a limit on the number of buttons that can be pressed at once.) & No sample buffer allocator is available.";
    case -2147220981:
        return "A mapper file function failed because reading or writing the user or IHV settings file failed. & A run-time error occurred.";
    case -2147220980:
        return "No buffer space has been set";
    case -2147220979:
        return "The buffer is not big enough.";
    case -2147220978:
        return "An invalid alignment was specified.";
    case -2147220977:
        return "Cannot change allocated memory while the filter is active.";
    case -2147220976:
        return "One or more buffers are still active.";
    case -2147220975:
        return "Cannot allocate a sample when the allocator is not active.";
    case -2147220974:
        return "Cannot allocate memory because no size has been set.";
    case -2147220973:
        return "Cannot lock for synchronization because no clock has been defined.";
    case -2147220972:
        return "Quality messages could not be sent because no quality sink has been defined.";
    case -2147220971:
        return "A required interface has not been implemented.";
    case -2147220970:
        return "An object or name was not found.";
    case -2147220969:
        return "No combination of intermediate filters could be found to make the connection.";
    case -2147220968:
        return "No combination of filters could be found to render the stream.";
    case -2147220967:
        return "Could not change formats dynamically.";
    case -2147220966:
        return "No color key has been set.";
    case -2147220965:
        return "Current pin connection is not using the IOverlay transport.";
    case -2147220964:
        return "Current pin connection is not using the IMemInputPin transport.";
    case -2147220963:
        return "Setting a color key would conflict with the palette already set.";
    case -2147220962:
        return "Setting a palette would conflict with the color key already set.";
    case -2147220961:
        return "No matching color key is available.";
    case -2147220960:
        return "No palette is available.";
    case -2147220959:
        return "Display does not use a palette.";
    case -2147220958:
        return "Too many colors for the current display settings.";
    case -2147220957:
        return "The state changed while waiting to process the sample.";
    case -2147220956:
        return "The operation could not be performed because the filter is not stopped.";
    case -2147220955:
        return "The operation could not be performed because the filter is not paused.";
    case -2147220954:
        return "The operation could not be performed because the filter is not running.";
    case -2147220953:
        return "The operation could not be performed because the filter is in the wrong state.";
    case -2147220952:
        return "The sample start time is after the sample end time.";
    case -2147220951:
        return "The supplied rectangle is invalid.";
    case -2147220950:
        return "This pin cannot use the supplied media type.";
    case -2147220949:
        return "This sample cannot be rendered.";
    case -2147220948:
        return "This sample cannot be rendered because the end of the stream has been reached.";
    case -2147220947:
        return "An attempt to add a filter with a duplicate name failed.";
    case -2147220946:
        return "A time-out has expired.";
    case -2147220945:
        return "The file format is invalid.";
    case -2147220944:
        return "The list has already been exhausted.";
    case -2147220943:
        return "The filter graph is circular.";
    case -2147220942:
        return "Updates are not allowed in this state.";
    case -2147220941:
        return "An attempt was made to queue a command for a time in the past.";
    case -2147220940:
        return "The queued command has already been canceled.";
    case -2147220939:
        return "Cannot render the file because it is corrupt.";
    case -2147220938:
        return "An overlay advise link already exists.";
    case -2147220936:
        return "No full-screen modes are available.";
    case -2147220935:
        return "This Advise cannot be canceled because it was not successfully set.";
    case -2147220934:
        return "A full-screen mode is not available.";
    case -2147220933:
        return "Cannot call IVideoWindow methods while in full-screen mode.";
    case -2147220928:
        return "The media type of this file is not recognized.";
    case -2147220927:
        return "The source filter for this file could not be loaded.";
    case -2147220925:
        return "A file appeared to be incomplete.";
    case -2147220924:
        return "The version number of the file is invalid.";
    case -2147220921:
        return "This file is corrupt: it contains an invalid class identifier.";
    case -2147220920:
        return "This file is corrupt: it contains an invalid media type.";
    case -2147220919:
        return "No time stamp has been set for this sample.";
    case -2147220911:
        return "No media time stamp has been set for this sample.";
    case -2147220910:
        return "No media time format has been selected.";
    case -2147220909:
        return "Cannot change balance because audio device is mono only.";
    case -2147220907:
        return "Cannot play back the video stream: no suitable decompressor could be found.";
    case -2147220906:
        return "Cannot play back the audio stream: no audio hardware is available, or the hardware is not responding.";
    case -2147220903:
        return "Cannot play back the video stream: format 'RPZA' is not supported.";
    case -2147220901:
        return "ActiveMovie cannot play MPEG movies on this processor.";
    case -2147220900:
        return "Cannot play back the audio stream: the audio format is not supported.";
    case -2147220899:
        return "Cannot play back the video stream: the video format is not supported.";
    case -2147220898:
        return "ActiveMovie cannot play this video stream because it falls outside the constrained standard.";
    case -2147220897:
        return "Cannot perform the requested function on an object that is not in the filter graph.";
    case -2147220895:
        return "Cannot get or set time related information on an object that is using a time format of TIME_FORMAT_NONE.";
    case -2147220894:
        return "The connection cannot be made because the stream is read only and the filter alters the data.";
    case -2147220892:
        return "The buffer is not full enough.";
    case -2147220891:
        return "Cannot play back the file.  The format is not supported.";
    case -2147220890:
        return "Pins cannot connect due to not supporting the same transport.";
    case -2147220887:
        return "The Video CD can't be read correctly by the device or is the data is corrupt.";
    case -2147220879:
        return "There is not enough Video Memory at this display resolution and number of colors. Reducing resolution might help.";
    case -2147220878:
        return "The VideoPort connection negotiation process has failed.";
    case -2147220877:
        return "Either DirectDraw has not been installed or the Video Card capabilities are not suitable. Make sure the display is not in 16 color mode.";
    case -2147220876:
        return "No VideoPort hardware is available, or the hardware is not responding.";
    case -2147220875:
        return "No Capture hardware is available, or the hardware is not responding.";
    case -2147220874:
        return "This User Operation is inhibited by DVD Content at this time.";
    case -2147220873:
        return "This Operation is not permitted in the current domain.";
    case -2147220872:
        return "The specified button is invalid or is not present at the current time, or there is no button present at the specified location.";
    case -2147220871:
        return "DVD-Video playback graph has not been built yet.";
    case -2147220870:
        return "DVD-Video playback graph building failed.";
    case -2147220869:
        return "DVD-Video playback graph could not be built due to insufficient decoders.";
    case -2147220868:
        return "Version number of DirectDraw not suitable. Make sure to install dx5 or higher version.";
    case -2147220867:
        return "Copy protection cannot be enabled. Please make sure any other copy protected content is not being shown now.";
    case -2147220865:
        return "This object cannot be used anymore as its time has expired.";
    case -2147220863:
        return "The operation cannot be performed at the current playback speed.";
    case -2147220862:
        return "The specified menu doesn't exist.";
    case -2147220861:
        return "The specified command was either cancelled or no longer exists.";
    case -2147220860:
        return "The data did not contain a recognized version.";
    case -2147220859:
        return "The state data was corrupt.";
    case -2147220858:
        return "The state data is from a different disc.";
    case -2147220857:
        return "The region was not compatible with the current drive.";
    case -2147220856:
        return "The requested DVD stream attribute does not exist.";
    case -2147220855:
        return "Currently there is no GoUp (Annex J user function) program chain (PGC).";
    case -2147220854:
        return "The current parental level was too low.";
    case -2147220853:
        return "The current audio is not karaoke content.";
    case -2147220850:
        return "Frame step is not supported on this configuration.";
    case -2147220849:
        return "The specified stream is disabled and cannot be selected.";
    case -2147220848:
        return "The operation depends on the current title number, however the navigator has not yet entered the VTSM or the title domains, so the 'current' title index is unknown.";
    case -2147220847:
        return "The specified path does not point to a valid DVD disc.";
    case -2147220846:
        return "There is currently no resume information.";
    case -2147220845:
        return "This thread has already blocked this output pin.  There is no need to call IPinFlowControl::Block() again.";
    case -2147220844:
        return "IPinFlowControl::Block() has been called on another thread.  The current thread cannot make any assumptions about this pin's block state.";
    case -2147220843:
        return "An operation failed due to a certification failure.";
    case -2147220736:
        return "Device driver-specific codes. Unless the specific driver has been precisely identified, no meaning should be attributed to these values other than that the driver originated the error.";
    case -2147220735:
        return "DIERR_DRIVERFIRST+1";
    case -2147220734:
        return "DIERR_DRIVERFIRST+2";
    case -2147220733:
        return "DIERR_DRIVERFIRST+3";
    case -2147220732:
        return "DIERR_DRIVERFIRST+4";
    case -2147220731:
        return "DIERR_DRIVERFIRST+5";
    case -2147220494:
        return "A registry entry is corrupt.";
    case -2147220481:
        return "Device installer errors.";
    case -2147220480:
        return "Registry entry or DLL for class installer invalid or class installer not found.";
    case -2147220479:
        return "The user cancelled the install operation. & The stream already has allocated samples and the surface doesn't match the sample format.";
    case -2147220478:
        return "The INF file for the selected device could not be found or is invalid or is damaged. & The specified purpose ID can't be used for the call.";
    case -2147220477:
        return "No stream can be found with the specified attributes.";
    case -2147220476:
        return "Seeking not supported for this object.";
    case -2147220475:
        return "The stream formats are not compatible.";
    case -2147220474:
        return "The sample is busy.";
    case -2147220473:
        return "The object can't accept the call because its initialize function or equivalent has not been called.";
    case -2147220472:
        return "MS_E_SOURCEALREADYDEFINED";
    case -2147220471:
        return "The stream type is not valid for this operation.";
    case -2147220470:
        return "The object is not in running state.";
    case -2147024894:
        return "The system cannot find the file specified.";
    case -2147024893:
        return "The system cannot find the path specified.";
    case -2147024892:
        return "The system cannot open the file.";
    case -2147024891:
        return "Access is denied";
    case -2147024890:
        return "Invalid handle";
    case -2147024888:
        return "Not enough storage is available to process this command.";
    case -2147024887:
        return "The storage control block address is invalid.";
    case -2147024886:
        return "The environment is incorrect.";
    case -2147024885:
        return "An attempt was made to load a program with an incorrect format.";
    case -2147024884:
        return "The operation cannot be performed unless the device is acquired.";
    case -2147024882:
        return "Ran out of memory";
    case -2147024875:
        return "This object has not been initialized";
    case -2147024866:
        return "Access to the device has been lost.  It must be re-acquired.";
    case -2147024809:
        return "An invalid parameter was passed to the returning function";
    case -2147024777:
        return "The object could not be created due to an incompatible driver version or mismatched or incomplete driver components.";
    case -2147024726:
        return "The operation cannot be performed while the device is acquired.";
    case -2147024637:
        return "No more items.";
    case -2147023746:
        return "The application requires a newer version of DirectInput.";
    case -2147023743:
        return "The application was written for an unsupported prerelease version of DirectInput.";
    case -2147023728:
        return "The specified property ID is not supported for the specified property set.";
    case -2147023726:
        return "The specified property set is not supported.";
    case -2147023649:
        return "This object is already initialized";
    case -2146107362:
        return "Buffer too small";
    case -2146107318:
        return "Exception";
    case -2146107272:
        return "Invalid flags";
    case -2146107262:
        return "Invalid object";
    case -2146107257:
        return "Invalid player";
    case -2146107247:
        return "Invalid group";
    case -2146107242:
        return "Invalid handle";
    case -2146107092:
        return "Session lost";
    case -2146107090:
        return "No voice session";
    case -2146107032:
        return "Connection lost";
    case -2146107031:
        return "Not initialized";
    case -2146107030:
        return "Connected";
    case -2146107029:
        return "Not connected";
    case -2146107026:
        return "Connect aborting";
    case -2146107025:
        return "Not allowed";
    case -2146107024:
        return "Invalid target";
    case -2146107023:
        return "Transport not host";
    case -2146107022:
        return "Compression not supported";
    case -2146107021:
        return "Already pending";
    case -2146107020:
        return "Sound init failure";
    case -2146107019:
        return "Time out";
    case -2146107018:
        return "Connect aborted";
    case -2146107017:
        return "No 3d sound";
    case -2146107016:
        return "Already buffered";
    case -2146107015:
        return "Not buffered";
    case -2146107014:
        return "Hosting";
    case -2146107013:
        return "Not hosting";
    case -2146107012:
        return "Invalid device";
    case -2146107011:
        return "Record system error";
    case -2146107010:
        return "Playback system error";
    case -2146107009:
        return "Send error";
    case -2146107008:
        return "User cancel";
    case -2146107005:
        return "Run setup";
    case -2146107004:
        return "Incompatible version";
    case -2146107001:
        return "Initialized";
    case -2146107000:
        return "No transport";
    case -2146106999:
        return "No callback";
    case -2146106998:
        return "Transport not init";
    case -2146106997:
        return "Transport no session";
    case -2146106996:
        return "Transport no player";
    case -2146106995:
        return "User back";
    case -2146106994:
        return "No rec vol available";
    case -2146106993:
        return "Invalid buffer";
    case -2146106992:
        return "Locked buffer";
    case -2146074576:
        return "Aborted";
    case -2146074560:
        return "Addressing";
    case -2146074544:
        return "Already closing";
    case -2146074528:
        return "Already connected";
    case -2146074512:
        return "Already disconnecting";
    case -2146074496:
        return "Already initialized";
    case -2146074480:
        return "Already registered";
    case -2146074368:
        return "Buffer too small";
    case -2146074352:
        return "Can not cancel";
    case -2146074336:
        return "Cant create group";
    case -2146074320:
        return "Cant create player";
    case -2146074304:
        return "Cant launch application";
    case -2146074288:
        return "Connecting";
    case -2146074272:
        return "Connection lost";
    case -2146074256:
        return "Conversion";
    case -2146074251:
        return "Data too large";
    case -2146074240:
        return "Does not exist";
    case -2146074235:
        return "dpnsvr not available";
    case -2146074224:
        return "Duplicate command";
    case -2146074112:
        return "End point not receiving";
    case -2146074096:
        return "Enum query too large";
    case -2146074080:
        return "Enum response too large";
    case -2146074064:
        return "Exception";
    case -2146074048:
        return "Group not empty";
    case -2146074032:
        return "Hosting";
    case -2146074016:
        return "Host rejected connection";
    case -2146074000:
        return "Host terminated session";
    case -2146073984:
        return "Incomplete address";
    case -2146073968:
        return "Invalid address format";
    case -2146073856:
        return "Invalid application";
    case -2146073840:
        return "Invalid command";
    case -2146073824:
        return "Invalid device address";
    case -2146073808:
        return "Invalid end point";
    case -2146073792:
        return "Invalid flags";
    case -2146073776:
        return "Invalid group";
    case -2146073760:
        return "Invalid handle";
    case -2146073744:
        return "Invalid host address";
    case -2146073728:
        return "Invalid instance";
    case -2146073712:
        return "Invalid interface";
    case -2146073600:
        return "Invalid object";
    case -2146073584:
        return "Invalid password";
    case -2146073568:
        return "Invalid player";
    case -2146073552:
        return "Invalid priority";
    case -2146073536:
        return "Invalid string";
    case -2146073520:
        return "Invalid url";
    case -2146073504:
        return "Invalid version";
    case -2146073488:
        return "No caps";
    case -2146073472:
        return "No connection";
    case -2146073456:
        return "No host player";
    case -2146073344:
        return "No more address components";
    case -2146073328:
        return "No response";
    case -2146073312:
        return "Not allowed";
    case -2146073296:
        return "Not host";
    case -2146073280:
        return "Not ready";
    case -2146073264:
        return "Not registered";
    case -2146073248:
        return "Player already in group";
    case -2146073232:
        return "Player lost";
    case -2146073216:
        return "Player not in group";
    case -2146073200:
        return "Player not reachable";
    case -2146073088:
        return "Send too large";
    case -2146073072:
        return "Session full";
    case -2146073056:
        return "Table full";
    case -2146073040:
        return "Timed out";
    case -2146073024:
        return "Uninitialized";
    case -2146073008:
        return "User cancel";
    case -2005532667:
        return "This object is already initialized";
    case -2005532662:
        return "This surface can not be attached to the requested surface.";
    case -2005532652:
        return "This surface can not be detached from the requested surface.";
    case -2005532632:
        return "Support is currently not available.";
    case -2005532617:
        return "An exception was encountered while performing the requested operation";
    case -2005532582:
        return "Height of rectangle provided is not a multiple of reqd alignment";
    case -2005532577:
        return "Unable to match primary surface creation request with existing primary surface.";
    case -2005532572:
        return "One or more of the caps bits passed to the callback are incorrect.";
    case -2005532562:
        return "DirectDraw does not support provided Cliplist.";
    case -2005532552:
        return "DirectDraw does not support the requested mode";
    case -2005532542:
        return "DirectDraw received a pointer that was an invalid DIRECTDRAW object.";
    case -2005532527:
        return "pixel format was invalid as specified";
    case -2005532522:
        return "Rectangle provided was invalid.";
    case -2005532512:
        return "Operation could not be carried out because one or more surfaces are locked";
    case -2005532502:
        return "There is no 3D present.";
    case -2005532492:
        return "Operation could not be carried out because there is no alpha accleration hardware present or available.";
    case -2005532491:
        return "Operation could not be carried out because there is no stereo hardware present or available.";
    case -2005532490:
        return "Operation could not be carried out because there is no hardware present which supports stereo surfaces";
    case -2005532467:
        return "no clip list available";
    case -2005532462:
        return "Operation could not be carried out because there is no color conversion hardware present or available.";
    case -2005532460:
        return "Create function called without DirectDraw object method SetCooperativeLevel being called.";
    case -2005532457:
        return "Surface doesn't currently have a color key";
    case -2005532452:
        return "Operation could not be carried out because there is no hardware support of the dest color key.";
    case -2005532450:
        return "No DirectDraw support possible with current display driver";
    case -2005532447:
        return "Operation requires the application to have exclusive mode but the application does not have exclusive mode.";
    case -2005532442:
        return "Flipping visible surfaces is not supported.";
    case -2005532432:
        return "There is no GDI present.";
    case -2005532422:
        return "Operation could not be carried out because there is no hardware present or available.";
    case -2005532417:
        return "Requested item was not found";
    case -2005532412:
        return "Operation could not be carried out because there is no overlay hardware present or available.";
    case -2005532402:
        return "Operation could not be carried out because the source and destination rectangles are on the same surface and overlap each other.";
    case -2005532392:
        return "Operation could not be carried out because there is no appropriate raster op hardware present or available.";
    case -2005532382:
        return "Operation could not be carried out because there is no rotation hardware present or available.";
    case -2005532362:
        return "Operation could not be carried out because there is no hardware support for stretching";
    case -2005532356:
        return "DirectDrawSurface is not in 4 bit color palette and the requested operation requires 4 bit color palette.";
    case -2005532355:
        return "DirectDrawSurface is not in 4 bit color index palette and the requested operation requires 4 bit color index palette.";
    case -2005532352:
        return "DirectDraw Surface is not in 8 bit color mode and the requested operation requires 8 bit color.";
    case -2005532342:
        return "Operation could not be carried out because there is no texture mapping hardware present or available.";
    case -2005532337:
        return "Operation could not be carried out because there is no hardware support for vertical blank synchronized operations.";
    case -2005532332:
        return "Operation could not be carried out because there is no hardware support for zbuffer blting.";
    case -2005532322:
        return "Overlay surfaces could not be z layered based on their BltOrder because the hardware does not support z layering of overlays.";
    case -2005532312:
        return "The hardware needed for the requested operation has already been allocated.";
    case -2005532292:
        return "Out of video memory";
    case -2005532290:
        return "hardware does not support clipped overlays";
    case -2005532288:
        return "Can only have ony color key active at one time for overlays";
    case -2005532285:
        return "Access to this palette is being refused because the palette is already locked by another thread.";
    case -2005532272:
        return "No src color key specified for this operation.";
    case -2005532262:
        return "This surface is already attached to the surface it is being attached to.";
    case -2005532252:
        return "This surface is already a dependency of the surface it is being made a dependency of.";
    case -2005532242:
        return "Access to this surface is being refused because the surface is already locked by another thread.";
    case -2005532237:
        return "Access to this surface is being refused because no driver exists which can supply a pointer to the surface. This is most likely to happen when attempting to lock the primary surface when no DCI provider is present. Will also happen on attempts to lock an optimized surface.";
    case -2005532232:
        return "Access to Surface refused because Surface is obscured.";
    case -2005532222:
        return "Access to this surface is being refused because the surface is gone. The DIRECTDRAWSURFACE object representing this surface should have Restore called on it.";
    case -2005532212:
        return "The requested surface is not attached.";
    case -2005532202:
        return "Height requested by DirectDraw is too large.";
    case -2005532192:
        return "Size requested by DirectDraw is too large --  The individual height and width are OK.";
    case -2005532182:
        return "Width requested by DirectDraw is too large.";
    case -2005532162:
        return "Pixel format requested is unsupported by DirectDraw";
    case -2005532152:
        return "Bitmask in the pixel format requested is unsupported by DirectDraw";
    case -2005532151:
        return "The specified stream contains invalid data";
    case -2005532135:
        return "vertical blank is in progress";
    case -2005532132:
        return "Was still drawing";
    case -2005532130:
        return "The specified surface type requires specification of the COMPLEX flag";
    case -2005532112:
        return "Rectangle provided was not horizontally aligned on reqd. boundary";
    case -2005532111:
        return "The GUID passed to DirectDrawCreate is not a valid DirectDraw driver identifier.";
    case -2005532110:
        return "A DirectDraw object representing this driver has already been created for this process.";
    case -2005532109:
        return "A hardware only DirectDraw object creation was attempted but the driver did not support any hardware.";
    case -2005532108:
        return "this process already has created a primary surface";
    case -2005532107:
        return "software emulation not available.";
    case -2005532106:
        return "region passed to Clipper::GetClipList is too small.";
    case -2005532105:
        return "an attempt was made to set a clip list for a clipper objec that is already monitoring an hwnd.";
    case -2005532104:
        return "No clipper object attached to surface object";
    case -2005532103:
        return "Clipper notification requires an HWND or no HWND has previously been set as the CooperativeLevel HWND.";
    case -2005532102:
        return "HWND used by DirectDraw CooperativeLevel has been subclassed, this prevents DirectDraw from restoring state.";
    case -2005532101:
        return "The CooperativeLevel HWND has already been set. It can not be reset while the process has surfaces or palettes created.";
    case -2005532100:
        return "No palette object attached to this surface.";
    case -2005532099:
        return "No hardware support for 16 or 256 color palettes.";
    case -2005532098:
        return "If a clipper object is attached to the source surface passed into a BltFast call.";
    case -2005532097:
        return "No blter.";
    case -2005532096:
        return "No DirectDraw ROP hardware.";
    case -2005532095:
        return "returned when GetOverlayPosition is called on a hidden overlay";
    case -2005532094:
        return "returned when GetOverlayPosition is called on a overlay that UpdateOverlay has never been called on to establish a destionation.";
    case -2005532093:
        return "returned when the position of the overlay on the destionation is no longer legal for that destionation.";
    case -2005532092:
        return "returned when an overlay member is called for a non-overlay surface";
    case -2005532091:
        return "An attempt was made to set the cooperative level when it was already set to exclusive.";
    case -2005532090:
        return "An attempt has been made to flip a surface that is not flippable.";
    case -2005532089:
        return "Can't duplicate primary & 3D surfaces, or surfaces that are implicitly created.";
    case -2005532088:
        return "Surface was not locked.  An attempt to unlock a surface that was not locked at all, or by this process, has been attempted.";
    case -2005532087:
        return "Windows can not create any more DCs, or a DC was requested for a paltte-indexed surface when the surface had no palette AND the display mode was not palette-indexed (in this case DirectDraw cannot select a proper palette into the DC)";
    case -2005532086:
        return "No DC was ever created for this surface.";
    case -2005532085:
        return "This surface can not be restored because it was created in a different mode.";
    case -2005532084:
        return "This surface can not be restored because it is an implicitly created surface.";
    case -2005532083:
        return "The surface being used is not a palette-based surface";
    case -2005532082:
        return "The display is currently in an unsupported mode";
    case -2005532081:
        return "Operation could not be carried out because there is no mip-map texture mapping hardware present or available.";
    case -2005532080:
        return "The requested action could not be performed because the surface was of the wrong type.";
    case -2005532072:
        return "Device does not support optimized surfaces, therefore no video memory optimized surfaces";
    case -2005532071:
        return "Surface is an optimized surface, but has not yet been allocated any memory";
    case -2005532070:
        return "Attempt was made to create or set a device window without first setting the focus window";
    case -2005532069:
        return "Attempt was made to set a palette on a mipmap sublevel";
    case -2005532052:
        return "A DC has already been returned for this surface. Only one DC can be retrieved per surface.";
    case -2005532042:
        return "An attempt was made to allocate non-local video memory from a device that does not support non-local video memory.";
    case -2005532032:
        return "The attempt to page lock a surface failed.";
    case -2005532012:
        return "The attempt to page unlock a surface failed.";
    case -2005531992:
        return "An attempt was made to page unlock a surface with no outstanding page locks.";
    case -2005531982:
        return "There is more data available than the specified buffer size could hold";
    case -2005531981:
        return "The data has expired and is therefore no longer valid.";
    case -2005531980:
        return "The mode test has finished executing.";
    case -2005531979:
        return "The mode test has switched to a new mode.";
    case -2005531978:
        return "D3D has not yet been initialized.";
    case -2005531977:
        return "The video port is not active";
    case -2005531976:
        return "The monitor does not have EDID data.";
    case -2005531975:
        return "The driver does not enumerate display mode refresh rates.";
    case -2005531973:
        return "Surfaces created by one direct draw device cannot be used directly by another direct draw device.";
    case -2005531804:
        return "Bad array size";
    case -2005531803:
        return "Bad data reference";
    case -2005531802:
        return "Internal error";
    case -2005531801:
        return "No more objects";
    case -2005531800:
        return "Bad intrinsics";
    case -2005531799:
        return "No more stream handles";
    case -2005531798:
        return "No more data";
    case -2005531797:
        return "Bad cache file";
    case -2005531796:
        return "No internet";
    case -2005531772:
        return "Bad object";
    case -2005531771:
        return "Bad value";
    case -2005531770:
        return "Bad type";
    case -2005531769:
        return "Not found";
    case -2005531768:
        return "Not done yet";
    case -2005531767:
        return "File not found";
    case -2005531766:
        return "Resource not found";
    case -2005531765:
        return "Bad resource";
    case -2005531764:
        return "Bad file type";
    case -2005531763:
        return "Bad file version";
    case -2005531762:
        return "Bad file float size";
    case -2005531761:
        return "Bad file";
    case -2005531760:
        return "Parse error";
    case -2005531759:
        return "Bad array size";
    case -2005531758:
        return "Bad data reference";
    case -2005531757:
        return "No more objects";
    case -2005531756:
        return "No more data";
    case -2005531755:
        return "Bad cache file";
    case -2005530600:
        return "Wrong texture format";
    case -2005530599:
        return "Unsupported color operation";
    case -2005530598:
        return "Unsupported color arg";
    case -2005530597:
        return "Unsupported alpha operation";
    case -2005530596:
        return "Unsupported alpha arg";
    case -2005530595:
        return "Too many operations";
    case -2005530594:
        return "Conflicting texture filter";
    case -2005530593:
        return "Unsupported factor value";
    case -2005530591:
        return "Conflicting render state";
    case -2005530590:
        return "Unsupported texture filter";
    case -2005530586:
        return "Conflicting texture palette";
    case -2005530585:
        return "Driver internal error";
    case -2005530522:
        return "Not found";
    case -2005530521:
        return "More data";
    case -2005530520:
        return "Device lost";
    case -2005530519:
        return "Device not reset";
    case -2005530518:
        return "Not available";
    case -2005530517:
        return "Invalid device";
    case -2005530516:
        return "Invalid call";
    case -2005530515:
        return "Driver invalid call";
    case -2005529772:
        return "Can not modify index buffer";
    case -2005529771:
        return "Invalid mesh";
    case -2005529770:
        return "Cannot attr sort";
    case -2005529769:
        return "Skinning not supported";
    case -2005529768:
        return "Too many influences";
    case -2005529767:
        return "Invalid data";
    case -2005529766:
        return "Loaded mesh has no data";
    case -2005529765:
        return "Duplicate named fragment";
    case -2005529764:
        return "Can Not remove last item";
    case -2005401590:
        return "The call failed because resources (such as a priority level) were already being used by another caller";
    case -2005401570:
        return "The control (vol, pan, etc.) requested by the caller is not available";
    case -2005401550:
        return "This call is not valid for the current state of this object";
    case -2005401530:
        return "The caller does not have the priority level required for the function to succeed";
    case -2005401500:
        return "The specified WAVE format is not supported";
    case -2005401480:
        return "No sound driver is available for use";
    case -2005401470:
        return "This object is already initialized";
    case -2005401450:
        return "The buffer memory has been lost, and must be restored";
    case -2005401440:
        return "Another app has a higher priority level, preventing this call from succeeding";
    case -2005401430:
        return "This object has not been initialized";
    case -2005401420:
        return "Tried to create a DSBCAPS_CTRLFX buffer shorter than DSBSIZE_FX_MIN milliseconds";
    case -2005401410:
        return "Attempt to use DirectSound 8 functionality on an older DirectSound object";
    case -2005401400:
        return "A circular loop of send effects was detected";
    case -2005401390:
        return "The GUID specified in an audiopath file does not match a valid MIXIN buffer";
    case -2005397247:
        return "An unexpected error was returned from a device driver, indicating possible failure of the driver or hardware.";
    case -2005397246:
        return "The requested operation cannot be performed while there are  instantiated ports in any process in the system.";
    case -2005397245:
        return "The requested device is already in use (possibly by a non-DirectMusic client) and cannot be opened again.";
    case -2005397244:
        return "Buffer is not large enough for requested operation.";
    case -2005397243:
        return "No buffer was prepared for the download data.";
    case -2005397242:
        return "Download failed due to inability to access or create download buffer.";
    case -2005397240:
        return "Error parsing DLS collection. File is corrupt.";
    case -2005397239:
        return "Wave chunks in DLS collection file are at incorrect offsets.";
    case -2005397231:
        return "Second attempt to load a DLS collection that is currently open. ";
    case -2005397229:
        return "Error reading wave data from DLS collection. Indicates bad file.";
    case -2005397228:
        return "There is no instrument in the collection that matches patch number.";
    case -2005397227:
        return "The IStream* doesn't support Seek().";
    case -2005397226:
        return "The IStream* doesn't support Write().";
    case -2005397225:
        return "The RIFF parser doesn't contain a required chunk while parsing file.";
    case -2005397223:
        return "Invalid download id was used in the process of creating a download buffer.";
    case -2005397216:
        return "Tried to unload an object that was not downloaded or previously unloaded.";
    case -2005397215:
        return "Buffer was already downloaded to synth.";
    case -2005397214:
        return "The specified property item was not recognized by the target object.";
    case -2005397213:
        return "The specified property item may not be set on the target object.";
    case -2005397212:
        return "* The specified property item may not be retrieved from the target object.";
    case -2005397211:
        return "Wave chunk has more than one interleaved channel. DLS format requires MONO.";
    case -2005397210:
        return "Invalid articulation chunk in DLS collection.";
    case -2005397209:
        return "Invalid instrument chunk in DLS collection.";
    case -2005397208:
        return "Wavelink chunk in DLS collection points to invalid wave.";
    case -2005397207:
        return "Articulation missing from instrument in DLS collection.";
    case -2005397206:
        return "Downoaded DLS wave is not in PCM format. ";
    case -2005397205:
        return "Bad wave chunk in DLS collection";
    case -2005397204:
        return "Offset Table for download buffer has errors. ";
    case -2005397203:
        return "Attempted to download unknown data type.";
    case -2005397202:
        return "The operation could not be completed because no sink was connected to the synthesizer.";
    case -2005397201:
        return "An attempt was made to open the software synthesizer while it was already  open.";
    case -2005397200:
        return "An attempt was made to close the software synthesizer while it was already  open.";
    case -2005397199:
        return "The operation could not be completed because the software synth has not  yet been fully configured.";
    case -2005397198:
        return "The operation cannot be carried out while the synthesizer is active.";
    case -2005397197:
        return "An error occurred while attempting to read from the IStream* object.";
    case -2005397196:
        return "The operation cannot be performed because the final instance of the DirectMusic object was released. Ports cannot be used after final  release of the DirectMusic object.";
    case -2005397195:
        return "There was no data in the referenced buffer.";
    case -2005397194:
        return "There is insufficient space to insert the given event into the buffer.";
    case -2005397193:
        return "The given operation could not be carried out because the port is a capture port.";
    case -2005397192:
        return "The given operation could not be carried out because the port is a render port.";
    case -2005397191:
        return "The port could not be created because no DirectSound has been specified. Specify a DirectSound interface via the IDirectMusic::SetDirectSound method; pass NULL to have DirectMusic manage usage of DirectSound.";
    case -2005397190:
        return "The operation cannot be carried out while the port is active.";
    case -2005397189:
        return "Invalid DirectSound buffer was handed to port. ";
    case -2005397188:
        return "Invalid buffer format was handed to the synth sink.";
    case -2005397187:
        return "The operation cannot be carried out while the synthesizer is inactive.";
    case -2005397186:
        return "IDirectMusic::SetDirectSound has already been called. It may not be changed while in use.";
    case -2005397185:
        return "The given event is invalid (either it is not a valid MIDI message or it makes use of running status). The event cannot be packed into the buffer.";
    case -2005397168:
        return "The IStream* object does not contain data supported by the loading object.";
    case -2005397167:
        return "The object has already been initialized.";
    case -2005397166:
        return "The file does not contain a valid band.";
    case -2005397163:
        return "The IStream* object's data does not have a track header as the first chunk, and therefore can not be read by the segment object.";
    case -2005397162:
        return "The IStream* object's data does not have a tool header as the first chunk, and therefore can not be read by the graph object.";
    case -2005397161:
        return "The IStream* object's data contains an invalid track header (ckid is 0 and fccType is NULL,) and therefore can not be read by the segment object.";
    case -2005397160:
        return "The IStream* object's data contains an invalid tool header (ckid is 0 and fccType is NULL,) and therefore can not be read by the graph object.";
    case -2005397159:
        return "The graph object was unable to load all tools from the IStream* object data. This may be due to errors in the stream, or the tools being incorrectly registered on the client.";
    case -2005397152:
        return "The segment object was unable to load all tracks from the IStream* object data. This may be due to errors in the stream, or the tracks being incorrectly registered on the client.";
    case -2005397151:
        return "The object requested was not found (numerically equal to DMUS_E_NOT_FOUND)";
    case -2005397150:
        return "A required object is not initialized or failed to initialize.";
    case -2005397149:
        return "The requested parameter type is currently disabled. Parameter types may be enabled and disabled by certain calls to SetParam().";
    case -2005397148:
        return "The requested parameter type is not supported on the object.";
    case -2005397147:
        return "The time is in the past, and the operation can not succeed.";
    case -2005397146:
        return "The requested track is not contained by the segment.";
    case -2005397145:
        return "The track does not support clock time playback or getparam.";
    case -2005397136:
        return "There is no master clock in the performance. Be sure to call IDirectMusicPerformance::Init().";
    case -2005397120:
        return "The class id field is required and missing in the DMUS_OBJECTDESC.";
    case -2005397119:
        return "The requested file path is invalid.";
    case -2005397118:
        return "File open failed - either file doesn't exist or is locked.";
    case -2005397117:
        return "Search data type is not supported.";
    case -2005397116:
        return "Unable to find or create object.";
    case -2005397115:
        return "Object was not found.";
    case -2005397114:
        return "The file name is missing from the DMUS_OBJECTDESC.";
    case -2005396992:
        return "The file requested is not a valid file.";
    case -2005396991:
        return "The tool is already contained in the graph. Create a new instance.";
    case -2005396990:
        return "Value is out of range, for instance the requested length is longer than the segment.";
    case -2005396989:
        return "Segment initialization failed, most likely due to a critical memory situation.";
    case -2005396988:
        return "The DMUS_PMSG has already been sent to the performance object via IDirectMusicPerformance::SendPMsg().";
    case -2005396987:
        return "The DMUS_PMSG was either not allocated by the performance via IDirectMusicPerformance::AllocPMsg(), or it was already freed via IDirectMusicPerformance::FreePMsg().";
    case -2005396986:
        return "The default system port could not be opened.";
    case -2005396985:
        return "A call to MIDIToMusic() or MusicToMIDI() resulted in an error because the requested conversion could not happen. This usually occurs when the provided DMUS_CHORD_KEY structure has an invalid chord or scale pattern.";
    case -2005396976:
        return "DMUS_E_DESCEND_CHUNK_FAIL is returned when the end of the file  was reached before the desired chunk was found.";
    case -2005396975:
        return "An attempt to use this object failed because it first needs to be loaded.";
    case -2005396973:
        return "The activeX scripting engine for the script's language is not compatible with DirectMusic.";
    case -2005396972:
        return "A varient was used that had a type that is not supported by DirectMusic.";
    case -2005396971:
        return "An error was encountered while parsing or executing the script. The pErrorInfo parameter (if supplied) was filled with information about the error.";
    case -2005396970:
        return "Loading of oleaut32.dll failed.  VBScript and other activeX scripting languages require use of oleaut32.dll.  On platforms where oleaut32.dll is not present, only the DirectMusicScript language, which doesn't require oleaut32.dll can be used.";
    case -2005396969:
        return "An error occured while parsing a script loaded using LoadScript.  The script that was loaded contains an error.";
    case -2005396968:
        return "The script file is invalid.";
    case -2005396967:
        return "The file contains an invalid script track.";
    case -2005396966:
        return "The script does not contain a variable with the specified name.";
    case -2005396965:
        return "The script does not contain a routine with the specified name.";
    case -2005396964:
        return "Scripts variables for content referenced or embedded in a script cannot be set.";
    case -2005396963:
        return "Attempt was made to set a script's variable by reference to a value that was not an object type.";
    case -2005396962:
        return "Attempt was made to set a script's variable by value to an object that does not support a default value property.";
    case -2005396960:
        return "The file contains an invalid segment trigger track.";
    case -2005396959:
        return "The file contains an invalid lyrics track.";
    case -2005396958:
        return "The file contains an invalid parameter control track.";
    case -2005396957:
        return "A script written in AudioVBScript could not be read because it contained a statement that is not allowed by the AudioVBScript language.";
    case -2005396956:
        return "A script routine written in AudioVBScript failed because an invalid operation occurred.  For example, adding the number 3 to a segment object would produce this error.  So would attempting to call a routine that doesn't exist.";
    case -2005396955:
        return "A script routine written in AudioVBScript failed because a function outside of a script failed to complete. For example, a call to PlaySegment that fails to play because of low memory would return this error.";
    case -2005396954:
        return "The Performance has set up some PChannels using the AssignPChannel command, which makes it not capable of supporting audio paths.";
    case -2005396953:
        return "This is the inverse of the previous error. The Performance has set up some audio paths, which makes is incompatible with the calls to allocate pchannels, etc. ";
    case -2005396952:
        return "A segment or song was asked for its embedded audio path configuration, but there isn't any. ";
    case -2005396951:
        return "An audiopath is inactive, perhaps because closedown was called.";
    case -2005396950:
        return "An audiopath failed to create because a requested buffer could not be created.";
    case -2005396949:
        return "An audiopath could not be used for playback because it lacked port assignments.";
    case -2005396948:
        return "Attempt was made to play segment in audiopath mode and there was no audiopath.";
    case -2005396947:
        return "Invalid data was found in a RIFF file chunk.";
    case -2005396946:
        return "Attempt was made to create an audiopath that sends to a global effects buffer which did not exist.";
    case -2005396945:
        return "The file does not contain a valid container object.";
    case -931722312:
        return "Out of memory";
    case -931722311:
        return "A NULL pointer was passed as a parameter";
    case -931722310:
        return "The Device Index passed in is invalid";
    case -931722309:
        return "DirectDraw has not been created";
    case -931722308:
        return "Direct3D has not been created";
    case -931722307:
        return "Direct3D device has not been created";
    case -931722306:
        return "Primary surface has not been created";
    case -931722305:
        return "Z buffer has not been created";
    case -931722304:
        return "Backbuffer has not been created";
    case -931722303:
        return "Failed to update caps database after changing display mode";
    case -931722302:
        return "Could not create Z buffer";
    case -931722301:
        return "Display mode is not valid";
    case -931722300:
        return "One or more of the parameters passed is invalid";
    case -931722299:
        return "D3DX failed to initialize itself";
    case -931722298:
        return "D3DX failed to start up";
    case -931722297:
        return "D3DXInitialize() must be called first";
    case -931722296:
        return "D3DX is not initialized yet";
    case -931722295:
        return "Failed to render text to the surface";
    case -931722294:
        return "Bad D3DX context";
    case -931722293:
        return "The requested device capabilities are not supported";
    case -931722292:
        return "The image file format is unrecognized";
    case -931722291:
        return "The image file loading library error";
    case -931722290:
        return "Could not obtain device caps";
    case -931722289:
        return "Resize does not work for full-screen";
    case -931722288:
        return "Resize does not work for non-windowed contexts";
    case -931722287:
        return "Front buffer already exists";
    case -931722286:
        return "The app is using the primary in full-screen mode";
    case -931722285:
        return "Could not get device context";
    case -931722284:
        return "Could not bitBlt";
    case -931722283:
        return "There is no surface backing up this texture";
    case -931722282:
        return "There is no such miplevel for this surface";
    case -931722281:
        return "The surface is not paletted";
    case -931722280:
        return "An error occured while enumerating surface formats";
    case -931722279:
        return "D3DX only supports color depths of 16 bit or greater";
    case -931722278:
        return "The file format is invalid";
    case -931722277:
        return "No suitable match found";
    case 11:
        return "An attempt was made to load a program with an incorrect format.";
    case 14:
        return "The system cannot find the drive specified.";
    case 262147:
        return "End of stream. Sample not updated.";
    case 262403:
        return "The end of the list has been reached.";
    case 262701:
        return "An attempt to add a filter with a duplicate name succeeded with a modified name.";
    case 262711:
        return "The state transition has not completed.";
    case 262722:
        return "Some of the streams in this movie are in an unsupported format.";
    case 262725:
        return "The file contained some property settings that were not used.";
    case 262726:
        return "Some connections have failed and have been deferred.";
    case 262736:
        return "The resource specified is no longer needed.";
    case 262740:
        return "A connection could not be made with the media type in the persistent graph, but has been made with a negotiated media type.";
    case 262743:
        return "Cannot play back the video stream: no suitable decompressor could be found.";
    case 262744:
        return "Cannot play back the audio stream: no audio hardware is available.";
    case 262746:
        return "Cannot play back the video stream: format 'RPZA' is not supported.";
    case 262752:
        return "The value returned had to be estimated.  It's accuracy can not be guaranteed.";
    case 262755:
        return "This success code is reserved for internal purposes within ActiveMovie.";
    case 262759:
        return "The stream has been turned off.";
    case 262760:
        return "The graph can't be cued because of lack of or corrupt data.";
    case 262768:
        return "The stop time for the sample was not set.";
    case 262782:
        return "There was no preview pin available, so the capture pin output is being split to provide both capture and preview.";
    case 262784:
        return "The current title was not a sequential set of chapters (PGC), and the returned timing information might not be continuous.";
    case 262796:
        return "The audio stream did not contain sufficient information to determine the contents of each channel.";
    case 262797:
        return "The seek into the movie was not frame accurate.";
    case 1376261:
        return "Full duplex";
    case 1376266:
        return "Half duplex";
    case 1376272:
        return "Pending";
    case 141953135:
        return "The call succeeded but there won't be any mipmaps generated";
    case 142082058:
        return "The call succeeded, but we had to substitute the 3D algorithm";
    case 142086289:
        return "The object could only load partially. This can happen if some components are not registered properly, such as embedded tracks and tools. This can also happen if some content is missing. For example, if a segment uses a DLS collection that is not in the loader's current search directory.";
    case 142086290:
        return "Return value from IDirectMusicBand::Download() which indicates that some of the instruments safely downloaded, but others failed. This usually occurs when some instruments are on PChannels not supported by the performance or port.";
    case 142086656:
        return "Return value from IDirectMusicTool::ProcessPMsg() which indicates to the performance that it should cue the PMsg again automatically.";
    case 142086657:
        return "Return value from IDirectMusicTool::ProcessPMsg() which indicates to the performance that it should free the PMsg automatically.";
    case 142086658:
        return "Return value from IDirectMusicTrack::Play() which indicates to the segment that the track has no more data after mtEnd.";
    case 142086672:
        return "Returned string has been truncated to fit the buffer size.";
    case 142086673:
        return "Returned from IDirectMusicGraph::StampPMsg(), this indicates that the PMsg is already stamped with the last tool in the graph. The returned PMsg's tool pointer is now NULL.";
    case 142086674:
        return "Returned from IDirectMusicPerformance::MusicToMIDI(), this indicates  that no note has been calculated because the music value has the note  at a position higher than the top note of the chord. This applies only to DMUS_PLAYMODE_NORMALCHORD play mode. This success code indicates that the caller should not do anything with the note. It is not meant to be played against this chord.";
    case 142086675:
        return "Returned from IDirectMusicPerformance::MIDIToMusic(),  and IDirectMusicPerformance::MusicToMIDI(), this indicates  that the note conversion generated a note value that is below 0,  so it has been bumped up one or more octaves to be in the proper MIDI range of 0 through 127.  Note that this is valid for MIDIToMusic() when using play modes DMUS_PLAYMODE_FIXEDTOCHORD and DMUS_PLAYMODE_FIXEDTOKEY, both of which store MIDI values in wMusicValue. With MusicToMIDI(), it is valid for all play modes. Ofcourse, DMUS_PLAYMODE_FIXED will never return this success code.";
    case 142086676:
        return "Returned from IDirectMusicPerformance::MIDIToMusic(),  and IDirectMusicPerformance::MusicToMIDI(), this indicates  that the note conversion generated a note value that is above 127, so it has been bumped down one or more octaves to be in the proper MIDI range of 0 through 127.  Note that this is valid for MIDIToMusic() when using play modes DMUS_PLAYMODE_FIXEDTOCHORD and DMUS_PLAYMODE_FIXEDTOKEY, both of which store MIDI values in wMusicValue. With MusicToMIDI(), it is valid for all play modes. Ofcourse, DMUS_PLAYMODE_FIXED will never return this success code.";
    case 142086677:
        return "Although the audio output from the port will be routed to the same device as the given DirectSound buffer, buffer controls such as pan and volume will not affect the output.";
    case 142086678:
        return "The requested operation was not performed because during CollectGarbage the loader determined that the object had been released.";
    default:
        return "n/a";
    }
}
