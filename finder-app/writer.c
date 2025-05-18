#include <syslog.h>
#include <stdio.h>

int main(int argc, char**argv)
{
    openlog (NULL, LOG_CONS | LOG_PERROR, LOG_USER);
    FILE* writefile = fopen(argv[1],"w");
    int ex_sts =1;
    if(argc!=3)
    {
    	syslog(LOG_ERR, "One or all of the parameters above were not specified");
    }
    else
    {
    	if(writefile)
    	{
    		syslog(LOG_USER, "Writing file to directory");
    		if(fputs(argv[2], writefile))
    		{
    		syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
    		ex_sts=0;
    		}
    		else
    		{
    		syslog(LOG_ERR, "Cannot write to file");
    		}
    	}
    	else
    	{
    	syslog(LOG_ERR, "Cannot open file");
    	}
    }
    return ex_sts;
}
