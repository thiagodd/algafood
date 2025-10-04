package com.thiagodd.algafood.domain.exception;

public class EntityInUseException extends NoStacktraceException{
    public EntityInUseException(String message) {
        super(message);
    }

    public EntityInUseException(String message, Throwable cause) {
        super(message, cause);
    }
}
