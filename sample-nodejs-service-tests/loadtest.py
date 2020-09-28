import sys
import time
import logging 
import requests

def load_test(port, no_of_requests, logger):
  try:
    logger.debug("Starting load-test for login request")
    machine_ip='SampleOnlineBankStaging'
    endpoint='/login/'
    
    header_value="LoadTestId=" + job_name + ";request=login"
    http_req = "http://" + machine_ip + ":" + port + endpoint
    header = {'x-dynatrace-test':header_value}
    
    for i in range(int(no_of_requests)):
      rsp = requests.get(http_req,header)

      if rsp.status_code >=400:
        logger.debug("Request failed", rsp.text)

      time.sleep(1)

  except Exception as e:
    logger.critical("Encountered exception while running smoke_test", exc_info=e)

  finally: 
    logger.debug("Completed load-test for login request")
if __name__=="__main__":
   port = sys.argv[1]
   no_of_requests = sys.argv[2]
   log_file = sys.argv[4]
   job_name = sys.argv[3]

   logging.basicConfig(filename=log_file,
                                filemode='w',
                                format='%(asctime)s,%(msecs)d %(name)s %(levelname)s %(message)s',
                                datefmt='%H:%M:%S',
                                level=logging.DEBUG)
   logger = logging.getLogger()
   logger.debug("------------------------Commencing load tests----------------------------")
   load_test(port, no_of_requests, logger)
   logger.debug("------------------------load test completed----------------------------")
   logging.shutdown()
