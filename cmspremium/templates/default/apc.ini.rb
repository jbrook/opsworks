extension=apc.so
apc.enabled=<%= @enabled%>
apc.shm_segments=1
apc.shm_size=<%= @shm_size%>
apc.num_files_hint=1024
apc.user_entries_hint=4096
apc.ttl=0
apc.use_request_time=1
apc.user_ttl=7200
apc.gc_ttl=<%= @gc_ttl%>
apc.cache_by_default=1
apc.filters
apc.mmap_file_mask=/apc.shm.XXXXXX
apc.file_update_protection=2
apc.enable_cli=0
apc.max_file_size=128K
apc.stat=1
apc.stat_ctime=0
apc.canonicalize=0
apc.write_lock=1
apc.report_autofilter=0
apc.rfc1867=0
apc.rfc1867_prefix =upload_
apc.rfc1867_name=APC_UPLOAD_PROGRESS
apc.rfc1867_freq=0
apc.rfc1867_ttl=3600
apc.include_once_override=0
apc.lazy_classes=0
apc.lazy_functions=0
apc.coredump_unmap=0
apc.file_md5=0
apc.preload_path
apc.localcache = 1
apc.localcache.size = 256