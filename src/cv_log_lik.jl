function cv_log_lik(X, y, beta, dist, penalty_matrix, train_idx, test_idx)
    # Extract the training and test data
    X_train, y_train = X[train_idx, :], y[train_idx]
    X_test, y_test = X[test_idx, :], y[test_idx]
    # Compute the predicted values on the training data
    y_pred_train = X_train * beta
    y_pred_train = dist.linkinv.(y_pred_train)
    # Compute the log likelihood on the training data
    log_lik_train = sum(logpdf.(dist, y_train, y_pred_train))
    # Compute the penalty on the training data
    penalty_train = beta' * penalty_matrix * beta
    # Compute the predicted values on the test data
    y_pred_test = X_test * beta
    y_pred_test = dist.linkinv.(y_pred_test)
    # Compute the log likelihood on the test data
    log_lik_test = sum(logpdf.(dist, y_test, y_pred_test))
    # Return the negative of the sum of the training and test log likelihoods
    return -(log_lik_train + log_lik_test - lambda * penalty_train)
end