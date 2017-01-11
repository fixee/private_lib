#ifndef _utils_h_
#define _utils_h_

#include <fcntl.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>

#ifdef __cplusplus 
extern "C" {
#endif

int tcp_listen( short port, int queue_len ) {
    int fd = socket( AF_INET, SOCK_STREAM, 0 );
    if( fd < 0 ) return -1;

    struct sockaddr_in addr;
    memset( &addr, 0, sizeof( addr ) );
    addr.sin_family = AF_INET;
    addr.sin_port = htons( port );
    addr.sin_addr.s_addr = htonl( INADDR_ANY );
    
    if( bind( fd, (struct sockaddr *)&addr, sizeof( addr ) ) < 0 )
        return -1;

    if( listen( fd, queue_len ) < 0 )
        return -1;

    return fd;
}

int tcp_accept_new_connection( int server ) {
    struct sockaddr_in addr;
    socklen_t sock_size = sizeof( addr );
    memset( &addr, 0, sizeof( addr ) );
    int fd = accept( server, (struct sockaddr *)&addr, &sock_size );
    if( fd < 0 ) return -1;

    return fd;
}

static void set_fd_nonblock( int fd ) {
    fcntl( fd, F_SETFL, fcntl( fd, F_GETFL, 0 ) | O_NONBLOCK );
}

#ifdef __cplusplus 
}
#endif

#endif//_utils_h_
