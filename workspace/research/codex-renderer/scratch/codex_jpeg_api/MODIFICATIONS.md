# JPEG creation API draft — not canonical

Preserve target_alloc and target_free across the creation-time MEMZERO, alongside
err and client_data. Target evidence:10041710 saves/restores fields+24/+28 and
clears368 bytes;10049e00 likewise clears440 bytes. Input fields use the already
pinned jpeg_bgr header. No new calling convention or historical TU is inferred.

Fresh baseline_jpeg_gw_mrcxy compiles both modified IJG source TUs. The retained
default_decompress_parms393 shape matches; neither Create body matches the
target's register-argument convention. Both remain DEFER, zero new byte credit.

test_jpeg_roundtrip.c with JPEG_API_CREATE uses these real creation routines,
not the manual host initialization adapter. Link this overlay's jcapimin.c and
jdapimin.c in place of the jpeg_bgr versions; other modules remain jpeg_bgr.
Combined replay74884 passed the latest callback/client_data preservation
assertions and the real Create roundtrip. This is host source integration,
not original DLL execution or checksum proof. IJG notices in source are retained.
