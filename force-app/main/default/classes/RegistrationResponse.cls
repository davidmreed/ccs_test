public with sharing class RegistrationResponse {
    public String applicationName;
    public Boolean result;
    public Error[] errors = new Error[]{};

    public RegistrationResponse(String applicationName, Boolean result) {
        this.applicationName = applicationName;
        this.result = result;
    }

    public class Error {
        public String errorCode;
        public String errorMessage;

        public Error(String errorCode, String errorMessage) {
            this.errorCode = errorCode;
            this.errorMessage = errorMessage;
        }
    }
}