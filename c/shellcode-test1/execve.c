#include <unistd.h>

void main() {
	char *cmd[] = { "/bin/sh", (char *)0};
	execve(cmd[0],cmd, NULL);
}
