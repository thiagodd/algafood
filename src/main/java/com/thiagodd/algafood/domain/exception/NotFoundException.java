package com.thiagodd.algafood.domain.exception;

public class NotFoundException extends NoStacktraceException{

    public NotFoundException(String message) {
        super(message);
    }

    public NotFoundException(String message, Throwable cause) {
        super(message, cause);
    }

    public NotFoundException(String entity, Long id){
        this(String.format("Could not find %s with ID %d.", entity, id));
    }

}
