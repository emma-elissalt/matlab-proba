function x = LoiPoisson(p, n, k)
    lambda = p*n;
    x = exp(-1*lambda)*lambda.^k./factorial(k);
end