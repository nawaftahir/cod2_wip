#include <stddef.h>
const wchar_t *__stdcall Renderer_ErrorDescriptionW(int code)
{
    switch (code)
    {
    case -2147483638:
        return L"The data necessary to complete this operation is not yet available.";
    case -2147467263:
        return L"The function called is not supported at this time";
    case -2147467262:
        return L"The requested COM interface is not available";
    case -2147467261:
        return L"Invalid pointer";
    case -2147467260:
        return L"Operation aborted";
    case -2147467259:
        return L"An undetermined error occurred";
    case -2147418113:
        return L"Catastrophic failure";
    case -2147221232:
        return L"This object does not support aggregation";
    case -2147221164:
        return L"Class not registered";
    case -2147221008:
        return L"CoInitialize has not been called.";
    case -2147221007:
        return L"CoInitialize has already been called.";
    case -2147220992:
        return L"Unable to IDirectInputJoyConfig_Acquire because the user does not have sufficient privileges to change the joystick configuration. & An invalid media type was specified";
    case -2147220991:
        return L"The device is full. & An invalid media subtype was specified.";
    case -2147220990:
        return L"Not all the requested information fit into the buffer. & This object can only be created as an aggregated object.";
    case -2147220989:
        return L"The effect is not downloaded. & The enumerator has become invalid.";
    case -2147220988:
        return L"The device cannot be reinitialized because there are still effects attached to it. & At least one of the pins involved in the operation is already connected.";
    case -2147220987:
        return L"The operation cannot be performed unless the device is acquired in DISCL_EXCLUSIVE mode. & This operation cannot be performed because the filter is active.";
    case -2147220986:
        return L"The effect could not be downloaded because essential information is missing.  For example, no axes have been associated with the effect, or no type-specific information has been created. & One of the specified pins supports no media types.";
    case -2147220985:
        return L"Attempted to read buffered device data from a device that is not buffered. & There is no common media type between these pins.";
    case -2147220984:
        return L"An attempt was made to modify parameters of an effect while it is playing.  Not all hardware devices support altering the parameters of an effect while it is playing. & Two pins of the same direction cannot be connected together.";
    case -2147220983:
        return L"The operation could not be completed because the device is not plugged in. & The operation cannot be performed because the pins are not connected.";
    case -2147220982:
        return L"SendDeviceData failed because more information was requested to be sent than can be sent to the device.  Some devices have restrictions on how much data can be sent to them.  (For example, there might be a limit on the number of buttons that can be pressed at once.) & No sample buffer allocator is available.";
    case -2147220981:
        return L"A mapper file function failed because reading or writing the user or IHV settings file failed. & A run-time error occurred.";
    case -2147220980:
        return L"No buffer space has been set";
    case -2147220979:
        return L"The buffer is not big enough.";
    case -2147220978:
        return L"An invalid alignment was specified.";
    case -2147220977:
        return L"Cannot change allocated memory while the filter is active.";
    case -2147220976:
        return L"One or more buffers are still active.";
    case -2147220975:
        return L"Cannot allocate a sample when the allocator is not active.";
    case -2147220974:
        return L"Cannot allocate memory because no size has been set.";
    case -2147220973:
        return L"Cannot lock for synchronization because no clock has been defined.";
    case -2147220972:
        return L"Quality messages could not be sent because no quality sink has been defined.";
    case -2147220971:
        return L"A required interface has not been implemented.";
    case -2147220970:
        return L"An object or name was not found.";
    case -2147220969:
        return L"No combination of intermediate filters could be found to make the connection.";
    case -2147220968:
        return L"No combination of filters could be found to render the stream.";
    case -2147220967:
        return L"Could not change formats dynamically.";
    case -2147220966:
        return L"No color key has been set.";
    case -2147220965:
        return L"Current pin connection is not using the IOverlay transport.";
    case -2147220964:
        return L"Current pin connection is not using the IMemInputPin transport.";
    case -2147220963:
        return L"Setting a color key would conflict with the palette already set.";
    case -2147220962:
        return L"Setting a palette would conflict with the color key already set.";
    case -2147220961:
        return L"No matching color key is available.";
    case -2147220960:
        return L"No palette is available.";
    case -2147220959:
        return L"Display does not use a palette.";
    case -2147220958:
        return L"Too many colors for the current display settings.";
    case -2147220957:
        return L"The state changed while waiting to process the sample.";
    case -2147220956:
        return L"The operation could not be performed because the filter is not stopped.";
    case -2147220955:
        return L"The operation could not be performed because the filter is not paused.";
    case -2147220954:
        return L"The operation could not be performed because the filter is not running.";
    case -2147220953:
        return L"The operation could not be performed because the filter is in the wrong state.";
    case -2147220952:
        return L"The sample start time is after the sample end time.";
    case -2147220951:
        return L"The supplied rectangle is invalid.";
    case -2147220950:
        return L"This pin cannot use the supplied media type.";
    case -2147220949:
        return L"This sample cannot be rendered.";
    case -2147220948:
        return L"This sample cannot be rendered because the end of the stream has been reached.";
    case -2147220947:
        return L"An attempt to add a filter with a duplicate name failed.";
    case -2147220946:
        return L"A time-out has expired.";
    case -2147220945:
        return L"The file format is invalid.";
    case -2147220944:
        return L"The list has already been exhausted.";
    case -2147220943:
        return L"The filter graph is circular.";
    case -2147220942:
        return L"Updates are not allowed in this state.";
    case -2147220941:
        return L"An attempt was made to queue a command for a time in the past.";
    case -2147220940:
        return L"The queued command has already been canceled.";
    case -2147220939:
        return L"Cannot render the file because it is corrupt.";
    case -2147220938:
        return L"An overlay advise link already exists.";
    case -2147220936:
        return L"No full-screen modes are available.";
    case -2147220935:
        return L"This Advise cannot be canceled because it was not successfully set.";
    case -2147220934:
        return L"A full-screen mode is not available.";
    case -2147220933:
        return L"Cannot call IVideoWindow methods while in full-screen mode.";
    case -2147220928:
        return L"The media type of this file is not recognized.";
    case -2147220927:
        return L"The source filter for this file could not be loaded.";
    case -2147220925:
        return L"A file appeared to be incomplete.";
    case -2147220924:
        return L"The version number of the file is invalid.";
    case -2147220921:
        return L"This file is corrupt: it contains an invalid class identifier.";
    case -2147220920:
        return L"This file is corrupt: it contains an invalid media type.";
    case -2147220919:
        return L"No time stamp has been set for this sample.";
    case -2147220911:
        return L"No media time stamp has been set for this sample.";
    case -2147220910:
        return L"No media time format has been selected.";
    case -2147220909:
        return L"Cannot change balance because audio device is mono only.";
    case -2147220907:
        return L"Cannot play back the video stream: no suitable decompressor could be found.";
    case -2147220906:
        return L"Cannot play back the audio stream: no audio hardware is available, or the hardware is not responding.";
    case -2147220903:
        return L"Cannot play back the video stream: format 'RPZA' is not supported.";
    case -2147220901:
        return L"ActiveMovie cannot play MPEG movies on this processor.";
    case -2147220900:
        return L"Cannot play back the audio stream: the audio format is not supported.";
    case -2147220899:
        return L"Cannot play back the video stream: the video format is not supported.";
    case -2147220898:
        return L"ActiveMovie cannot play this video stream because it falls outside the constrained standard.";
    case -2147220897:
        return L"Cannot perform the requested function on an object that is not in the filter graph.";
    case -2147220895:
        return L"Cannot get or set time related information on an object that is using a time format of TIME_FORMAT_NONE.";
    case -2147220894:
        return L"The connection cannot be made because the stream is read only and the filter alters the data.";
    case -2147220892:
        return L"The buffer is not full enough.";
    case -2147220891:
        return L"Cannot play back the file.  The format is not supported.";
    case -2147220890:
        return L"Pins cannot connect due to not supporting the same transport.";
    case -2147220887:
        return L"The Video CD can't be read correctly by the device or is the data is corrupt.";
    case -2147220879:
        return L"There is not enough Video Memory at this display resolution and number of colors. Reducing resolution might help.";
    case -2147220878:
        return L"The VideoPort connection negotiation process has failed.";
    case -2147220877:
        return L"Either DirectDraw has not been installed or the Video Card capabilities are not suitable. Make sure the display is not in 16 color mode.";
    case -2147220876:
        return L"No VideoPort hardware is available, or the hardware is not responding.";
    case -2147220875:
        return L"No Capture hardware is available, or the hardware is not responding.";
    case -2147220874:
        return L"This User Operation is inhibited by DVD Content at this time.";
    case -2147220873:
        return L"This Operation is not permitted in the current domain.";
    case -2147220872:
        return L"The specified button is invalid or is not present at the current time, or there is no button present at the specified location.";
    case -2147220871:
        return L"DVD-Video playback graph has not been built yet.";
    case -2147220870:
        return L"DVD-Video playback graph building failed.";
    case -2147220869:
        return L"DVD-Video playback graph could not be built due to insufficient decoders.";
    case -2147220868:
        return L"Version number of DirectDraw not suitable. Make sure to install dx5 or higher version.";
    case -2147220867:
        return L"Copy protection cannot be enabled. Please make sure any other copy protected content is not being shown now.";
    case -2147220865:
        return L"This object cannot be used anymore as its time has expired.";
    case -2147220863:
        return L"The operation cannot be performed at the current playback speed.";
    case -2147220862:
        return L"The specified menu doesn't exist.";
    case -2147220861:
        return L"The specified command was either cancelled or no longer exists.";
    case -2147220860:
        return L"The data did not contain a recognized version.";
    case -2147220859:
        return L"The state data was corrupt.";
    case -2147220858:
        return L"The state data is from a different disc.";
    case -2147220857:
        return L"The region was not compatible with the current drive.";
    case -2147220856:
        return L"The requested DVD stream attribute does not exist.";
    case -2147220855:
        return L"Currently there is no GoUp (Annex J user function) program chain (PGC).";
    case -2147220854:
        return L"The current parental level was too low.";
    case -2147220853:
        return L"The current audio is not karaoke content.";
    case -2147220850:
        return L"Frame step is not supported on this configuration.";
    case -2147220849:
        return L"The specified stream is disabled and cannot be selected.";
    case -2147220848:
        return L"The operation depends on the current title number, however the navigator has not yet entered the VTSM or the title domains, so the 'current' title index is unknown.";
    case -2147220847:
        return L"The specified path does not point to a valid DVD disc.";
    case -2147220846:
        return L"There is currently no resume information.";
    case -2147220845:
        return L"This thread has already blocked this output pin.  There is no need to call IPinFlowControl::Block() again.";
    case -2147220844:
        return L"IPinFlowControl::Block() has been called on another thread.  The current thread cannot make any assumptions about this pin's block state.";
    case -2147220843:
        return L"An operation failed due to a certification failure.";
    case -2147220736:
        return L"Device driver-specific codes. Unless the specific driver has been precisely identified, no meaning should be attributed to these values other than that the driver originated the error.";
    case -2147220735:
        return L"DIERR_DRIVERFIRST+1";
    case -2147220734:
        return L"DIERR_DRIVERFIRST+2";
    case -2147220733:
        return L"DIERR_DRIVERFIRST+3";
    case -2147220732:
        return L"DIERR_DRIVERFIRST+4";
    case -2147220731:
        return L"DIERR_DRIVERFIRST+5";
    case -2147220494:
        return L"A registry entry is corrupt.";
    case -2147220481:
        return L"Device installer errors.";
    case -2147220480:
        return L"Registry entry or DLL for class installer invalid or class installer not found.";
    case -2147220479:
        return L"The user cancelled the install operation. & The stream already has allocated samples and the surface doesn't match the sample format.";
    case -2147220478:
        return L"The INF file for the selected device could not be found or is invalid or is damaged. & The specified purpose ID can't be used for the call.";
    case -2147220477:
        return L"No stream can be found with the specified attributes.";
    case -2147220476:
        return L"Seeking not supported for this object.";
    case -2147220475:
        return L"The stream formats are not compatible.";
    case -2147220474:
        return L"The sample is busy.";
    case -2147220473:
        return L"The object can't accept the call because its initialize function or equivalent has not been called.";
    case -2147220472:
        return L"MS_E_SOURCEALREADYDEFINED";
    case -2147220471:
        return L"The stream type is not valid for this operation.";
    case -2147220470:
        return L"The object is not in running state.";
    case -2147024894:
        return L"The system cannot find the file specified.";
    case -2147024893:
        return L"The system cannot find the path specified.";
    case -2147024892:
        return L"The system cannot open the file.";
    case -2147024891:
        return L"Access is denied";
    case -2147024890:
        return L"Invalid handle";
    case -2147024888:
        return L"Not enough storage is available to process this command.";
    case -2147024887:
        return L"The storage control block address is invalid.";
    case -2147024886:
        return L"The environment is incorrect.";
    case -2147024885:
        return L"An attempt was made to load a program with an incorrect format.";
    case -2147024884:
        return L"The operation cannot be performed unless the device is acquired.";
    case -2147024882:
        return L"Ran out of memory";
    case -2147024875:
        return L"This object has not been initialized";
    case -2147024866:
        return L"Access to the device has been lost.  It must be re-acquired.";
    case -2147024809:
        return L"An invalid parameter was passed to the returning function";
    case -2147024777:
        return L"The object could not be created due to an incompatible driver version or mismatched or incomplete driver components.";
    case -2147024726:
        return L"The operation cannot be performed while the device is acquired.";
    case -2147024637:
        return L"No more items.";
    case -2147023746:
        return L"The application requires a newer version of DirectInput.";
    case -2147023743:
        return L"The application was written for an unsupported prerelease version of DirectInput.";
    case -2147023728:
        return L"The specified property ID is not supported for the specified property set.";
    case -2147023726:
        return L"The specified property set is not supported.";
    case -2147023649:
        return L"This object is already initialized";
    case -2146107362:
        return L"Buffer too small";
    case -2146107318:
        return L"Exception";
    case -2146107272:
        return L"Invalid flags";
    case -2146107262:
        return L"Invalid object";
    case -2146107257:
        return L"Invalid player";
    case -2146107247:
        return L"Invalid group";
    case -2146107242:
        return L"Invalid handle";
    case -2146107092:
        return L"Session lost";
    case -2146107090:
        return L"No voice session";
    case -2146107032:
        return L"Connection lost";
    case -2146107031:
        return L"Not initialized";
    case -2146107030:
        return L"Connected";
    case -2146107029:
        return L"Not connected";
    case -2146107026:
        return L"Connect aborting";
    case -2146107025:
        return L"Not allowed";
    case -2146107024:
        return L"Invalid target";
    case -2146107023:
        return L"Transport not host";
    case -2146107022:
        return L"Compression not supported";
    case -2146107021:
        return L"Already pending";
    case -2146107020:
        return L"Sound init failure";
    case -2146107019:
        return L"Time out";
    case -2146107018:
        return L"Connect aborted";
    case -2146107017:
        return L"No 3d sound";
    case -2146107016:
        return L"Already buffered";
    case -2146107015:
        return L"Not buffered";
    case -2146107014:
        return L"Hosting";
    case -2146107013:
        return L"Not hosting";
    case -2146107012:
        return L"Invalid device";
    case -2146107011:
        return L"Record system error";
    case -2146107010:
        return L"Playback system error";
    case -2146107009:
        return L"Send error";
    case -2146107008:
        return L"User cancel";
    case -2146107005:
        return L"Run setup";
    case -2146107004:
        return L"Incompatible version";
    case -2146107001:
        return L"Initialized";
    case -2146107000:
        return L"No transport";
    case -2146106999:
        return L"No callback";
    case -2146106998:
        return L"Transport not init";
    case -2146106997:
        return L"Transport no session";
    case -2146106996:
        return L"Transport no player";
    case -2146106995:
        return L"User back";
    case -2146106994:
        return L"No rec vol available";
    case -2146106993:
        return L"Invalid buffer";
    case -2146106992:
        return L"Locked buffer";
    case -2146074576:
        return L"Aborted";
    case -2146074560:
        return L"Addressing";
    case -2146074544:
        return L"Already closing";
    case -2146074528:
        return L"Already connected";
    case -2146074512:
        return L"Already disconnecting";
    case -2146074496:
        return L"Already initialized";
    case -2146074480:
        return L"Already registered";
    case -2146074368:
        return L"Buffer too small";
    case -2146074352:
        return L"Can not cancel";
    case -2146074336:
        return L"Cant create group";
    case -2146074320:
        return L"Cant create player";
    case -2146074304:
        return L"Cant launch application";
    case -2146074288:
        return L"Connecting";
    case -2146074272:
        return L"Connection lost";
    case -2146074256:
        return L"Conversion";
    case -2146074251:
        return L"Data too large";
    case -2146074240:
        return L"Does not exist";
    case -2146074235:
        return L"dpnsvr not available";
    case -2146074224:
        return L"Duplicate command";
    case -2146074112:
        return L"End point not receiving";
    case -2146074096:
        return L"Enum query too large";
    case -2146074080:
        return L"Enum response too large";
    case -2146074064:
        return L"Exception";
    case -2146074048:
        return L"Group not empty";
    case -2146074032:
        return L"Hosting";
    case -2146074016:
        return L"Host rejected connection";
    case -2146074000:
        return L"Host terminated session";
    case -2146073984:
        return L"Incomplete address";
    case -2146073968:
        return L"Invalid address format";
    case -2146073856:
        return L"Invalid application";
    case -2146073840:
        return L"Invalid command";
    case -2146073824:
        return L"Invalid device address";
    case -2146073808:
        return L"Invalid end point";
    case -2146073792:
        return L"Invalid flags";
    case -2146073776:
        return L"Invalid group";
    case -2146073760:
        return L"Invalid handle";
    case -2146073744:
        return L"Invalid host address";
    case -2146073728:
        return L"Invalid instance";
    case -2146073712:
        return L"Invalid interface";
    case -2146073600:
        return L"Invalid object";
    case -2146073584:
        return L"Invalid password";
    case -2146073568:
        return L"Invalid player";
    case -2146073552:
        return L"Invalid priority";
    case -2146073536:
        return L"Invalid string";
    case -2146073520:
        return L"Invalid url";
    case -2146073504:
        return L"Invalid version";
    case -2146073488:
        return L"No caps";
    case -2146073472:
        return L"No connection";
    case -2146073456:
        return L"No host player";
    case -2146073344:
        return L"No more address components";
    case -2146073328:
        return L"No response";
    case -2146073312:
        return L"Not allowed";
    case -2146073296:
        return L"Not host";
    case -2146073280:
        return L"Not ready";
    case -2146073264:
        return L"Not registered";
    case -2146073248:
        return L"Player already in group";
    case -2146073232:
        return L"Player lost";
    case -2146073216:
        return L"Player not in group";
    case -2146073200:
        return L"Player not reachable";
    case -2146073088:
        return L"Send too large";
    case -2146073072:
        return L"Session full";
    case -2146073056:
        return L"Table full";
    case -2146073040:
        return L"Timed out";
    case -2146073024:
        return L"Uninitialized";
    case -2146073008:
        return L"User cancel";
    case -2005532667:
        return L"This object is already initialized";
    case -2005532662:
        return L"This surface can not be attached to the requested surface.";
    case -2005532652:
        return L"This surface can not be detached from the requested surface.";
    case -2005532632:
        return L"Support is currently not available.";
    case -2005532617:
        return L"An exception was encountered while performing the requested operation";
    case -2005532582:
        return L"Height of rectangle provided is not a multiple of reqd alignment";
    case -2005532577:
        return L"Unable to match primary surface creation request with existing primary surface.";
    case -2005532572:
        return L"One or more of the caps bits passed to the callback are incorrect.";
    case -2005532562:
        return L"DirectDraw does not support provided Cliplist.";
    case -2005532552:
        return L"DirectDraw does not support the requested mode";
    case -2005532542:
        return L"DirectDraw received a pointer that was an invalid DIRECTDRAW object.";
    case -2005532527:
        return L"pixel format was invalid as specified";
    case -2005532522:
        return L"Rectangle provided was invalid.";
    case -2005532512:
        return L"Operation could not be carried out because one or more surfaces are locked";
    case -2005532502:
        return L"There is no 3D present.";
    case -2005532492:
        return L"Operation could not be carried out because there is no alpha accleration hardware present or available.";
    case -2005532491:
        return L"Operation could not be carried out because there is no stereo hardware present or available.";
    case -2005532490:
        return L"Operation could not be carried out because there is no hardware present which supports stereo surfaces";
    case -2005532467:
        return L"no clip list available";
    case -2005532462:
        return L"Operation could not be carried out because there is no color conversion hardware present or available.";
    case -2005532460:
        return L"Create function called without DirectDraw object method SetCooperativeLevel being called.";
    case -2005532457:
        return L"Surface doesn't currently have a color key";
    case -2005532452:
        return L"Operation could not be carried out because there is no hardware support of the dest color key.";
    case -2005532450:
        return L"No DirectDraw support possible with current display driver";
    case -2005532447:
        return L"Operation requires the application to have exclusive mode but the application does not have exclusive mode.";
    case -2005532442:
        return L"Flipping visible surfaces is not supported.";
    case -2005532432:
        return L"There is no GDI present.";
    case -2005532422:
        return L"Operation could not be carried out because there is no hardware present or available.";
    case -2005532417:
        return L"Requested item was not found";
    case -2005532412:
        return L"Operation could not be carried out because there is no overlay hardware present or available.";
    case -2005532402:
        return L"Operation could not be carried out because the source and destination rectangles are on the same surface and overlap each other.";
    case -2005532392:
        return L"Operation could not be carried out because there is no appropriate raster op hardware present or available.";
    case -2005532382:
        return L"Operation could not be carried out because there is no rotation hardware present or available.";
    case -2005532362:
        return L"Operation could not be carried out because there is no hardware support for stretching";
    case -2005532356:
        return L"DirectDrawSurface is not in 4 bit color palette and the requested operation requires 4 bit color palette.";
    case -2005532355:
        return L"DirectDrawSurface is not in 4 bit color index palette and the requested operation requires 4 bit color index palette.";
    case -2005532352:
        return L"DirectDraw Surface is not in 8 bit color mode and the requested operation requires 8 bit color.";
    case -2005532342:
        return L"Operation could not be carried out because there is no texture mapping hardware present or available.";
    case -2005532337:
        return L"Operation could not be carried out because there is no hardware support for vertical blank synchronized operations.";
    case -2005532332:
        return L"Operation could not be carried out because there is no hardware support for zbuffer blting.";
    case -2005532322:
        return L"Overlay surfaces could not be z layered based on their BltOrder because the hardware does not support z layering of overlays.";
    case -2005532312:
        return L"The hardware needed for the requested operation has already been allocated.";
    case -2005532292:
        return L"Out of video memory";
    case -2005532290:
        return L"hardware does not support clipped overlays";
    case -2005532288:
        return L"Can only have ony color key active at one time for overlays";
    case -2005532285:
        return L"Access to this palette is being refused because the palette is already locked by another thread.";
    case -2005532272:
        return L"No src color key specified for this operation.";
    case -2005532262:
        return L"This surface is already attached to the surface it is being attached to.";
    case -2005532252:
        return L"This surface is already a dependency of the surface it is being made a dependency of.";
    case -2005532242:
        return L"Access to this surface is being refused because the surface is already locked by another thread.";
    case -2005532237:
        return L"Access to this surface is being refused because no driver exists which can supply a pointer to the surface. This is most likely to happen when attempting to lock the primary surface when no DCI provider is present. Will also happen on attempts to lock an optimized surface.";
    case -2005532232:
        return L"Access to Surface refused because Surface is obscured.";
    case -2005532222:
        return L"Access to this surface is being refused because the surface is gone. The DIRECTDRAWSURFACE object representing this surface should have Restore called on it.";
    case -2005532212:
        return L"The requested surface is not attached.";
    case -2005532202:
        return L"Height requested by DirectDraw is too large.";
    case -2005532192:
        return L"Size requested by DirectDraw is too large --  The individual height and width are OK.";
    case -2005532182:
        return L"Width requested by DirectDraw is too large.";
    case -2005532162:
        return L"Pixel format requested is unsupported by DirectDraw";
    case -2005532152:
        return L"Bitmask in the pixel format requested is unsupported by DirectDraw";
    case -2005532151:
        return L"The specified stream contains invalid data";
    case -2005532135:
        return L"vertical blank is in progress";
    case -2005532132:
        return L"Was still drawing";
    case -2005532130:
        return L"The specified surface type requires specification of the COMPLEX flag";
    case -2005532112:
        return L"Rectangle provided was not horizontally aligned on reqd. boundary";
    case -2005532111:
        return L"The GUID passed to DirectDrawCreate is not a valid DirectDraw driver identifier.";
    case -2005532110:
        return L"A DirectDraw object representing this driver has already been created for this process.";
    case -2005532109:
        return L"A hardware only DirectDraw object creation was attempted but the driver did not support any hardware.";
    case -2005532108:
        return L"this process already has created a primary surface";
    case -2005532107:
        return L"software emulation not available.";
    case -2005532106:
        return L"region passed to Clipper::GetClipList is too small.";
    case -2005532105:
        return L"an attempt was made to set a clip list for a clipper objec that is already monitoring an hwnd.";
    case -2005532104:
        return L"No clipper object attached to surface object";
    case -2005532103:
        return L"Clipper notification requires an HWND or no HWND has previously been set as the CooperativeLevel HWND.";
    case -2005532102:
        return L"HWND used by DirectDraw CooperativeLevel has been subclassed, this prevents DirectDraw from restoring state.";
    case -2005532101:
        return L"The CooperativeLevel HWND has already been set. It can not be reset while the process has surfaces or palettes created.";
    case -2005532100:
        return L"No palette object attached to this surface.";
    case -2005532099:
        return L"No hardware support for 16 or 256 color palettes.";
    case -2005532098:
        return L"If a clipper object is attached to the source surface passed into a BltFast call.";
    case -2005532097:
        return L"No blter.";
    case -2005532096:
        return L"No DirectDraw ROP hardware.";
    case -2005532095:
        return L"returned when GetOverlayPosition is called on a hidden overlay";
    case -2005532094:
        return L"returned when GetOverlayPosition is called on a overlay that UpdateOverlay has never been called on to establish a destionation.";
    case -2005532093:
        return L"returned when the position of the overlay on the destionation is no longer legal for that destionation.";
    case -2005532092:
        return L"returned when an overlay member is called for a non-overlay surface";
    case -2005532091:
        return L"An attempt was made to set the cooperative level when it was already set to exclusive.";
    case -2005532090:
        return L"An attempt has been made to flip a surface that is not flippable.";
    case -2005532089:
        return L"Can't duplicate primary & 3D surfaces, or surfaces that are implicitly created.";
    case -2005532088:
        return L"Surface was not locked.  An attempt to unlock a surface that was not locked at all, or by this process, has been attempted.";
    case -2005532087:
        return L"Windows can not create any more DCs, or a DC was requested for a paltte-indexed surface when the surface had no palette AND the display mode was not palette-indexed (in this case DirectDraw cannot select a proper palette into the DC)";
    case -2005532086:
        return L"No DC was ever created for this surface.";
    case -2005532085:
        return L"This surface can not be restored because it was created in a different mode.";
    case -2005532084:
        return L"This surface can not be restored because it is an implicitly created surface.";
    case -2005532083:
        return L"The surface being used is not a palette-based surface";
    case -2005532082:
        return L"The display is currently in an unsupported mode";
    case -2005532081:
        return L"Operation could not be carried out because there is no mip-map texture mapping hardware present or available.";
    case -2005532080:
        return L"The requested action could not be performed because the surface was of the wrong type.";
    case -2005532072:
        return L"Device does not support optimized surfaces, therefore no video memory optimized surfaces";
    case -2005532071:
        return L"Surface is an optimized surface, but has not yet been allocated any memory";
    case -2005532070:
        return L"Attempt was made to create or set a device window without first setting the focus window";
    case -2005532069:
        return L"Attempt was made to set a palette on a mipmap sublevel";
    case -2005532052:
        return L"A DC has already been returned for this surface. Only one DC can be retrieved per surface.";
    case -2005532042:
        return L"An attempt was made to allocate non-local video memory from a device that does not support non-local video memory.";
    case -2005532032:
        return L"The attempt to page lock a surface failed.";
    case -2005532012:
        return L"The attempt to page unlock a surface failed.";
    case -2005531992:
        return L"An attempt was made to page unlock a surface with no outstanding page locks.";
    case -2005531982:
        return L"There is more data available than the specified buffer size could hold";
    case -2005531981:
        return L"The data has expired and is therefore no longer valid.";
    case -2005531980:
        return L"The mode test has finished executing.";
    case -2005531979:
        return L"The mode test has switched to a new mode.";
    case -2005531978:
        return L"D3D has not yet been initialized.";
    case -2005531977:
        return L"The video port is not active";
    case -2005531976:
        return L"The monitor does not have EDID data.";
    case -2005531975:
        return L"The driver does not enumerate display mode refresh rates.";
    case -2005531973:
        return L"Surfaces created by one direct draw device cannot be used directly by another direct draw device.";
    case -2005531804:
        return L"Bad array size";
    case -2005531803:
        return L"Bad data reference";
    case -2005531802:
        return L"Internal error";
    case -2005531801:
        return L"No more objects";
    case -2005531800:
        return L"Bad intrinsics";
    case -2005531799:
        return L"No more stream handles";
    case -2005531798:
        return L"No more data";
    case -2005531797:
        return L"Bad cache file";
    case -2005531796:
        return L"No internet";
    case -2005531772:
        return L"Bad object";
    case -2005531771:
        return L"Bad value";
    case -2005531770:
        return L"Bad type";
    case -2005531769:
        return L"Not found";
    case -2005531768:
        return L"Not done yet";
    case -2005531767:
        return L"File not found";
    case -2005531766:
        return L"Resource not found";
    case -2005531765:
        return L"Bad resource";
    case -2005531764:
        return L"Bad file type";
    case -2005531763:
        return L"Bad file version";
    case -2005531762:
        return L"Bad file float size";
    case -2005531761:
        return L"Bad file";
    case -2005531760:
        return L"Parse error";
    case -2005531759:
        return L"Bad array size";
    case -2005531758:
        return L"Bad data reference";
    case -2005531757:
        return L"No more objects";
    case -2005531756:
        return L"No more data";
    case -2005531755:
        return L"Bad cache file";
    case -2005530600:
        return L"Wrong texture format";
    case -2005530599:
        return L"Unsupported color operation";
    case -2005530598:
        return L"Unsupported color arg";
    case -2005530597:
        return L"Unsupported alpha operation";
    case -2005530596:
        return L"Unsupported alpha arg";
    case -2005530595:
        return L"Too many operations";
    case -2005530594:
        return L"Conflicting texture filter";
    case -2005530593:
        return L"Unsupported factor value";
    case -2005530591:
        return L"Conflicting render state";
    case -2005530590:
        return L"Unsupported texture filter";
    case -2005530586:
        return L"Conflicting texture palette";
    case -2005530585:
        return L"Driver internal error";
    case -2005530522:
        return L"Not found";
    case -2005530521:
        return L"More data";
    case -2005530520:
        return L"Device lost";
    case -2005530519:
        return L"Device not reset";
    case -2005530518:
        return L"Not available";
    case -2005530517:
        return L"Invalid device";
    case -2005530516:
        return L"Invalid call";
    case -2005530515:
        return L"Driver invalid call";
    case -2005529772:
        return L"Can not modify index buffer";
    case -2005529771:
        return L"Invalid mesh";
    case -2005529770:
        return L"Cannot attr sort";
    case -2005529769:
        return L"Skinning not supported";
    case -2005529768:
        return L"Too many influences";
    case -2005529767:
        return L"Invalid data";
    case -2005529766:
        return L"Loaded mesh has no data";
    case -2005529765:
        return L"Duplicate named fragment";
    case -2005529764:
        return L"Can Not remove last item";
    case -2005401590:
        return L"The call failed because resources (such as a priority level) were already being used by another caller";
    case -2005401570:
        return L"The control (vol, pan, etc.) requested by the caller is not available";
    case -2005401550:
        return L"This call is not valid for the current state of this object";
    case -2005401530:
        return L"The caller does not have the priority level required for the function to succeed";
    case -2005401500:
        return L"The specified WAVE format is not supported";
    case -2005401480:
        return L"No sound driver is available for use";
    case -2005401470:
        return L"This object is already initialized";
    case -2005401450:
        return L"The buffer memory has been lost, and must be restored";
    case -2005401440:
        return L"Another app has a higher priority level, preventing this call from succeeding";
    case -2005401430:
        return L"This object has not been initialized";
    case -2005401420:
        return L"Tried to create a DSBCAPS_CTRLFX buffer shorter than DSBSIZE_FX_MIN milliseconds";
    case -2005401410:
        return L"Attempt to use DirectSound 8 functionality on an older DirectSound object";
    case -2005401400:
        return L"A circular loop of send effects was detected";
    case -2005401390:
        return L"The GUID specified in an audiopath file does not match a valid MIXIN buffer";
    case -2005397247:
        return L"An unexpected error was returned from a device driver, indicating possible failure of the driver or hardware.";
    case -2005397246:
        return L"The requested operation cannot be performed while there are  instantiated ports in any process in the system.";
    case -2005397245:
        return L"The requested device is already in use (possibly by a non-DirectMusic client) and cannot be opened again.";
    case -2005397244:
        return L"Buffer is not large enough for requested operation.";
    case -2005397243:
        return L"No buffer was prepared for the download data.";
    case -2005397242:
        return L"Download failed due to inability to access or create download buffer.";
    case -2005397240:
        return L"Error parsing DLS collection. File is corrupt.";
    case -2005397239:
        return L"Wave chunks in DLS collection file are at incorrect offsets.";
    case -2005397231:
        return L"Second attempt to load a DLS collection that is currently open. ";
    case -2005397229:
        return L"Error reading wave data from DLS collection. Indicates bad file.";
    case -2005397228:
        return L"There is no instrument in the collection that matches patch number.";
    case -2005397227:
        return L"The IStream* doesn't support Seek().";
    case -2005397226:
        return L"The IStream* doesn't support Write().";
    case -2005397225:
        return L"The RIFF parser doesn't contain a required chunk while parsing file.";
    case -2005397223:
        return L"Invalid download id was used in the process of creating a download buffer.";
    case -2005397216:
        return L"Tried to unload an object that was not downloaded or previously unloaded.";
    case -2005397215:
        return L"Buffer was already downloaded to synth.";
    case -2005397214:
        return L"The specified property item was not recognized by the target object.";
    case -2005397213:
        return L"The specified property item may not be set on the target object.";
    case -2005397212:
        return L"* The specified property item may not be retrieved from the target object.";
    case -2005397211:
        return L"Wave chunk has more than one interleaved channel. DLS format requires MONO.";
    case -2005397210:
        return L"Invalid articulation chunk in DLS collection.";
    case -2005397209:
        return L"Invalid instrument chunk in DLS collection.";
    case -2005397208:
        return L"Wavelink chunk in DLS collection points to invalid wave.";
    case -2005397207:
        return L"Articulation missing from instrument in DLS collection.";
    case -2005397206:
        return L"Downoaded DLS wave is not in PCM format. ";
    case -2005397205:
        return L"Bad wave chunk in DLS collection";
    case -2005397204:
        return L"Offset Table for download buffer has errors. ";
    case -2005397203:
        return L"Attempted to download unknown data type.";
    case -2005397202:
        return L"The operation could not be completed because no sink was connected to the synthesizer.";
    case -2005397201:
        return L"An attempt was made to open the software synthesizer while it was already  open.";
    case -2005397200:
        return L"An attempt was made to close the software synthesizer while it was already  open.";
    case -2005397199:
        return L"The operation could not be completed because the software synth has not  yet been fully configured.";
    case -2005397198:
        return L"The operation cannot be carried out while the synthesizer is active.";
    case -2005397197:
        return L"An error occurred while attempting to read from the IStream* object.";
    case -2005397196:
        return L"The operation cannot be performed because the final instance of the DirectMusic object was released. Ports cannot be used after final  release of the DirectMusic object.";
    case -2005397195:
        return L"There was no data in the referenced buffer.";
    case -2005397194:
        return L"There is insufficient space to insert the given event into the buffer.";
    case -2005397193:
        return L"The given operation could not be carried out because the port is a capture port.";
    case -2005397192:
        return L"The given operation could not be carried out because the port is a render port.";
    case -2005397191:
        return L"The port could not be created because no DirectSound has been specified. Specify a DirectSound interface via the IDirectMusic::SetDirectSound method; pass NULL to have DirectMusic manage usage of DirectSound.";
    case -2005397190:
        return L"The operation cannot be carried out while the port is active.";
    case -2005397189:
        return L"Invalid DirectSound buffer was handed to port. ";
    case -2005397188:
        return L"Invalid buffer format was handed to the synth sink.";
    case -2005397187:
        return L"The operation cannot be carried out while the synthesizer is inactive.";
    case -2005397186:
        return L"IDirectMusic::SetDirectSound has already been called. It may not be changed while in use.";
    case -2005397185:
        return L"The given event is invalid (either it is not a valid MIDI message or it makes use of running status). The event cannot be packed into the buffer.";
    case -2005397168:
        return L"The IStream* object does not contain data supported by the loading object.";
    case -2005397167:
        return L"The object has already been initialized.";
    case -2005397166:
        return L"The file does not contain a valid band.";
    case -2005397163:
        return L"The IStream* object's data does not have a track header as the first chunk, and therefore can not be read by the segment object.";
    case -2005397162:
        return L"The IStream* object's data does not have a tool header as the first chunk, and therefore can not be read by the graph object.";
    case -2005397161:
        return L"The IStream* object's data contains an invalid track header (ckid is 0 and fccType is NULL,) and therefore can not be read by the segment object.";
    case -2005397160:
        return L"The IStream* object's data contains an invalid tool header (ckid is 0 and fccType is NULL,) and therefore can not be read by the graph object.";
    case -2005397159:
        return L"The graph object was unable to load all tools from the IStream* object data. This may be due to errors in the stream, or the tools being incorrectly registered on the client.";
    case -2005397152:
        return L"The segment object was unable to load all tracks from the IStream* object data. This may be due to errors in the stream, or the tracks being incorrectly registered on the client.";
    case -2005397151:
        return L"The object requested was not found (numerically equal to DMUS_E_NOT_FOUND)";
    case -2005397150:
        return L"A required object is not initialized or failed to initialize.";
    case -2005397149:
        return L"The requested parameter type is currently disabled. Parameter types may be enabled and disabled by certain calls to SetParam().";
    case -2005397148:
        return L"The requested parameter type is not supported on the object.";
    case -2005397147:
        return L"The time is in the past, and the operation can not succeed.";
    case -2005397146:
        return L"The requested track is not contained by the segment.";
    case -2005397145:
        return L"The track does not support clock time playback or getparam.";
    case -2005397136:
        return L"There is no master clock in the performance. Be sure to call IDirectMusicPerformance::Init().";
    case -2005397120:
        return L"The class id field is required and missing in the DMUS_OBJECTDESC.";
    case -2005397119:
        return L"The requested file path is invalid.";
    case -2005397118:
        return L"File open failed - either file doesn't exist or is locked.";
    case -2005397117:
        return L"Search data type is not supported.";
    case -2005397116:
        return L"Unable to find or create object.";
    case -2005397115:
        return L"Object was not found.";
    case -2005397114:
        return L"The file name is missing from the DMUS_OBJECTDESC.";
    case -2005396992:
        return L"The file requested is not a valid file.";
    case -2005396991:
        return L"The tool is already contained in the graph. Create a new instance.";
    case -2005396990:
        return L"Value is out of range, for instance the requested length is longer than the segment.";
    case -2005396989:
        return L"Segment initialization failed, most likely due to a critical memory situation.";
    case -2005396988:
        return L"The DMUS_PMSG has already been sent to the performance object via IDirectMusicPerformance::SendPMsg().";
    case -2005396987:
        return L"The DMUS_PMSG was either not allocated by the performance via IDirectMusicPerformance::AllocPMsg(), or it was already freed via IDirectMusicPerformance::FreePMsg().";
    case -2005396986:
        return L"The default system port could not be opened.";
    case -2005396985:
        return L"A call to MIDIToMusic() or MusicToMIDI() resulted in an error because the requested conversion could not happen. This usually occurs when the provided DMUS_CHORD_KEY structure has an invalid chord or scale pattern.";
    case -2005396976:
        return L"DMUS_E_DESCEND_CHUNK_FAIL is returned when the end of the file  was reached before the desired chunk was found.";
    case -2005396975:
        return L"An attempt to use this object failed because it first needs to be loaded.";
    case -2005396973:
        return L"The activeX scripting engine for the script's language is not compatible with DirectMusic.";
    case -2005396972:
        return L"A varient was used that had a type that is not supported by DirectMusic.";
    case -2005396971:
        return L"An error was encountered while parsing or executing the script. The pErrorInfo parameter (if supplied) was filled with information about the error.";
    case -2005396970:
        return L"Loading of oleaut32.dll failed.  VBScript and other activeX scripting languages require use of oleaut32.dll.  On platforms where oleaut32.dll is not present, only the DirectMusicScript language, which doesn't require oleaut32.dll can be used.";
    case -2005396969:
        return L"An error occured while parsing a script loaded using LoadScript.  The script that was loaded contains an error.";
    case -2005396968:
        return L"The script file is invalid.";
    case -2005396967:
        return L"The file contains an invalid script track.";
    case -2005396966:
        return L"The script does not contain a variable with the specified name.";
    case -2005396965:
        return L"The script does not contain a routine with the specified name.";
    case -2005396964:
        return L"Scripts variables for content referenced or embedded in a script cannot be set.";
    case -2005396963:
        return L"Attempt was made to set a script's variable by reference to a value that was not an object type.";
    case -2005396962:
        return L"Attempt was made to set a script's variable by value to an object that does not support a default value property.";
    case -2005396960:
        return L"The file contains an invalid segment trigger track.";
    case -2005396959:
        return L"The file contains an invalid lyrics track.";
    case -2005396958:
        return L"The file contains an invalid parameter control track.";
    case -2005396957:
        return L"A script written in AudioVBScript could not be read because it contained a statement that is not allowed by the AudioVBScript language.";
    case -2005396956:
        return L"A script routine written in AudioVBScript failed because an invalid operation occurred.  For example, adding the number 3 to a segment object would produce this error.  So would attempting to call a routine that doesn't exist.";
    case -2005396955:
        return L"A script routine written in AudioVBScript failed because a function outside of a script failed to complete. For example, a call to PlaySegment that fails to play because of low memory would return this error.";
    case -2005396954:
        return L"The Performance has set up some PChannels using the AssignPChannel command, which makes it not capable of supporting audio paths.";
    case -2005396953:
        return L"This is the inverse of the previous error. The Performance has set up some audio paths, which makes is incompatible with the calls to allocate pchannels, etc. ";
    case -2005396952:
        return L"A segment or song was asked for its embedded audio path configuration, but there isn't any. ";
    case -2005396951:
        return L"An audiopath is inactive, perhaps because closedown was called.";
    case -2005396950:
        return L"An audiopath failed to create because a requested buffer could not be created.";
    case -2005396949:
        return L"An audiopath could not be used for playback because it lacked port assignments.";
    case -2005396948:
        return L"Attempt was made to play segment in audiopath mode and there was no audiopath.";
    case -2005396947:
        return L"Invalid data was found in a RIFF file chunk.";
    case -2005396946:
        return L"Attempt was made to create an audiopath that sends to a global effects buffer which did not exist.";
    case -2005396945:
        return L"The file does not contain a valid container object.";
    case -931722312:
        return L"Out of memory";
    case -931722311:
        return L"A NULL pointer was passed as a parameter";
    case -931722310:
        return L"The Device Index passed in is invalid";
    case -931722309:
        return L"DirectDraw has not been created";
    case -931722308:
        return L"Direct3D has not been created";
    case -931722307:
        return L"Direct3D device has not been created";
    case -931722306:
        return L"Primary surface has not been created";
    case -931722305:
        return L"Z buffer has not been created";
    case -931722304:
        return L"Backbuffer has not been created";
    case -931722303:
        return L"Failed to update caps database after changing display mode";
    case -931722302:
        return L"Could not create Z buffer";
    case -931722301:
        return L"Display mode is not valid";
    case -931722300:
        return L"One or more of the parameters passed is invalid";
    case -931722299:
        return L"D3DX failed to initialize itself";
    case -931722298:
        return L"D3DX failed to start up";
    case -931722297:
        return L"D3DXInitialize() must be called first";
    case -931722296:
        return L"D3DX is not initialized yet";
    case -931722295:
        return L"Failed to render text to the surface";
    case -931722294:
        return L"Bad D3DX context";
    case -931722293:
        return L"The requested device capabilities are not supported";
    case -931722292:
        return L"The image file format is unrecognized";
    case -931722291:
        return L"The image file loading library error";
    case -931722290:
        return L"Could not obtain device caps";
    case -931722289:
        return L"Resize does not work for full-screen";
    case -931722288:
        return L"Resize does not work for non-windowed contexts";
    case -931722287:
        return L"Front buffer already exists";
    case -931722286:
        return L"The app is using the primary in full-screen mode";
    case -931722285:
        return L"Could not get device context";
    case -931722284:
        return L"Could not bitBlt";
    case -931722283:
        return L"There is no surface backing up this texture";
    case -931722282:
        return L"There is no such miplevel for this surface";
    case -931722281:
        return L"The surface is not paletted";
    case -931722280:
        return L"An error occured while enumerating surface formats";
    case -931722279:
        return L"D3DX only supports color depths of 16 bit or greater";
    case -931722278:
        return L"The file format is invalid";
    case -931722277:
        return L"No suitable match found";
    case 11:
        return L"An attempt was made to load a program with an incorrect format.";
    case 14:
        return L"The system cannot find the drive specified.";
    case 262147:
        return L"End of stream. Sample not updated.";
    case 262403:
        return L"The end of the list has been reached.";
    case 262701:
        return L"An attempt to add a filter with a duplicate name succeeded with a modified name.";
    case 262711:
        return L"The state transition has not completed.";
    case 262722:
        return L"Some of the streams in this movie are in an unsupported format.";
    case 262725:
        return L"The file contained some property settings that were not used.";
    case 262726:
        return L"Some connections have failed and have been deferred.";
    case 262736:
        return L"The resource specified is no longer needed.";
    case 262740:
        return L"A connection could not be made with the media type in the persistent graph, but has been made with a negotiated media type.";
    case 262743:
        return L"Cannot play back the video stream: no suitable decompressor could be found.";
    case 262744:
        return L"Cannot play back the audio stream: no audio hardware is available.";
    case 262746:
        return L"Cannot play back the video stream: format 'RPZA' is not supported.";
    case 262752:
        return L"The value returned had to be estimated.  It's accuracy can not be guaranteed.";
    case 262755:
        return L"This success code is reserved for internal purposes within ActiveMovie.";
    case 262759:
        return L"The stream has been turned off.";
    case 262760:
        return L"The graph can't be cued because of lack of or corrupt data.";
    case 262768:
        return L"The stop time for the sample was not set.";
    case 262782:
        return L"There was no preview pin available, so the capture pin output is being split to provide both capture and preview.";
    case 262784:
        return L"The current title was not a sequential set of chapters (PGC), and the returned timing information might not be continuous.";
    case 262796:
        return L"The audio stream did not contain sufficient information to determine the contents of each channel.";
    case 262797:
        return L"The seek into the movie was not frame accurate.";
    case 1376261:
        return L"Full duplex";
    case 1376266:
        return L"Half duplex";
    case 1376272:
        return L"Pending";
    case 141953135:
        return L"The call succeeded but there won't be any mipmaps generated";
    case 142082058:
        return L"The call succeeded, but we had to substitute the 3D algorithm";
    case 142086289:
        return L"The object could only load partially. This can happen if some components are not registered properly, such as embedded tracks and tools. This can also happen if some content is missing. For example, if a segment uses a DLS collection that is not in the loader's current search directory.";
    case 142086290:
        return L"Return value from IDirectMusicBand::Download() which indicates that some of the instruments safely downloaded, but others failed. This usually occurs when some instruments are on PChannels not supported by the performance or port.";
    case 142086656:
        return L"Return value from IDirectMusicTool::ProcessPMsg() which indicates to the performance that it should cue the PMsg again automatically.";
    case 142086657:
        return L"Return value from IDirectMusicTool::ProcessPMsg() which indicates to the performance that it should free the PMsg automatically.";
    case 142086658:
        return L"Return value from IDirectMusicTrack::Play() which indicates to the segment that the track has no more data after mtEnd.";
    case 142086672:
        return L"Returned string has been truncated to fit the buffer size.";
    case 142086673:
        return L"Returned from IDirectMusicGraph::StampPMsg(), this indicates that the PMsg is already stamped with the last tool in the graph. The returned PMsg's tool pointer is now NULL.";
    case 142086674:
        return L"Returned from IDirectMusicPerformance::MusicToMIDI(), this indicates  that no note has been calculated because the music value has the note  at a position higher than the top note of the chord. This applies only to DMUS_PLAYMODE_NORMALCHORD play mode. This success code indicates that the caller should not do anything with the note. It is not meant to be played against this chord.";
    case 142086675:
        return L"Returned from IDirectMusicPerformance::MIDIToMusic(),  and IDirectMusicPerformance::MusicToMIDI(), this indicates  that the note conversion generated a note value that is below 0,  so it has been bumped up one or more octaves to be in the proper MIDI range of 0 through 127.  Note that this is valid for MIDIToMusic() when using play modes DMUS_PLAYMODE_FIXEDTOCHORD and DMUS_PLAYMODE_FIXEDTOKEY, both of which store MIDI values in wMusicValue. With MusicToMIDI(), it is valid for all play modes. Ofcourse, DMUS_PLAYMODE_FIXED will never return this success code.";
    case 142086676:
        return L"Returned from IDirectMusicPerformance::MIDIToMusic(),  and IDirectMusicPerformance::MusicToMIDI(), this indicates  that the note conversion generated a note value that is above 127, so it has been bumped down one or more octaves to be in the proper MIDI range of 0 through 127.  Note that this is valid for MIDIToMusic() when using play modes DMUS_PLAYMODE_FIXEDTOCHORD and DMUS_PLAYMODE_FIXEDTOKEY, both of which store MIDI values in wMusicValue. With MusicToMIDI(), it is valid for all play modes. Ofcourse, DMUS_PLAYMODE_FIXED will never return this success code.";
    case 142086677:
        return L"Although the audio output from the port will be routed to the same device as the given DirectSound buffer, buffer controls such as pan and volume will not affect the output.";
    case 142086678:
        return L"The requested operation was not performed because during CollectGarbage the loader determined that the object had been released.";
    default:
        return L"n/a";
    }
}
