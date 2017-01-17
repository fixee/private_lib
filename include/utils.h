#ifndef _utils_h_
#define _utils_h_

#include <fcntl.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>

#if __cplusplus 
extern "C" {
#endif

struct c_str_t
{
    c_str_t( char *_str, size_t _size ):str(_str),size(_size){}
    char *str;
    size_t size;
};

int tcp_listen( short port, int queue_len );

int tcp_accept_new_connection( int server );

void set_fd_nonblock( int fd );

#if __cplusplus 
}
#endif

#endif//_utils_h_
