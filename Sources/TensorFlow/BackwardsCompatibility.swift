// Copyright 2019 The TensorFlow Authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//===------------------------------------------------------------------------------------------===//
// Losses
//===------------------------------------------------------------------------------------------===//

/// Returns the L1 loss between predictions and expectations.
///
/// - Parameters:
///   - predicted: Predicted outputs from a neural network.
///   - expected: Expected values, i.e. targets, that correspond to the correct output.
@differentiable(wrt: predicted)
public func l1Loss<Scalar: TensorFlowFloatingPoint>(
    predicted: Tensor<Scalar>,
    expected: Tensor<Scalar>
) -> Tensor<Scalar> {
    l1Loss(predicted: predicted, expected: expected, reduction: { $0.sum() })
}

/// Returns the L2 loss between predictions and expectations.
///
/// - Parameters:
///   - predicted: Predicted outputs from a neural network.
///   - expected: Expected values, i.e. targets, that correspond to the correct output.
@differentiable(wrt: predicted)
public func l2Loss<Scalar: TensorFlowFloatingPoint>(
    predicted: Tensor<Scalar>,
    expected: Tensor<Scalar>
) -> Tensor<Scalar> {
    l2Loss(predicted: predicted, expected: expected, reduction: { $0.sum() })
}

/// Returns the hinge loss between predictions and expectations.
///
/// - Parameters:
///   - predicted: Predicted outputs from a neural network.
///   - expected: Expected values, i.e. targets, that correspond to the correct output.
@differentiable(wrt: predicted)
public func hingeLoss<Scalar: TensorFlowFloatingPoint>(
    predicted: Tensor<Scalar>,
    expected: Tensor<Scalar>
) -> Tensor<Scalar> {
    hingeLoss(predicted: predicted, expected: expected, reduction: _mean)
}

/// Returns the squared hinge loss between predictions and expectations.
///
/// - Parameters:
///   - predicted: Predicted outputs from a neural network.
///   - expected: Expected values, i.e. targets, that correspond to the correct output.
@differentiable(wrt: predicted)
public func squaredHingeLoss<Scalar: TensorFlowFloatingPoint>(
    predicted: Tensor<Scalar>,
    expected: Tensor<Scalar>
) -> Tensor<Scalar> {
    squaredHingeLoss(predicted: predicted, expected: expected, reduction: _mean)
}

/// Returns the categorical hinge loss between predictions and expectations.
///
/// - Parameters:
///   - predicted: Predicted outputs from a neural network.
///   - expected: Expected values, i.e. targets, that correspond to the correct output.
@differentiable(wrt: predicted)
public func categoricalHingeLoss<Scalar: TensorFlowFloatingPoint>(
    predicted: Tensor<Scalar>,
    expected: Tensor<Scalar>
) -> Tensor<Scalar> {
    categoricalHingeLoss(predicted: predicted, expected: expected, reduction: _mean)
}

/// Returns the logarithm of the hyperbolic cosine of the error between predictions and
/// expectations.
///
/// - Parameters:
///   - predicted: Predicted outputs from a neural network.
///   - expected: Expected values, i.e. targets, that correspond to the correct output.
@differentiable(wrt: predicted)
public func logCoshLoss<Scalar: TensorFlowFloatingPoint>(
    predicted: Tensor<Scalar>,
    expected: Tensor<Scalar>
) -> Tensor<Scalar> {
    logCoshLoss(predicted: predicted, expected: expected, reduction: _mean)
}

/// Returns the Poisson loss between predictions and expectations.
///
/// - Parameters:
///   - predicted: Predicted outputs from a neural network.
///   - expected: Expected values, i.e. targets, that correspond to the correct output.
@differentiable(wrt: predicted)
public func poissonLoss<Scalar: TensorFlowFloatingPoint>(
    predicted: Tensor<Scalar>,
    expected: Tensor<Scalar>
) -> Tensor<Scalar> {
    poissonLoss(predicted: predicted, expected: expected, reduction: _mean)
}

/// Returns the Kullback-Leibler divergence (KL divergence) between between expectations and
/// predictions. Given two distributions `p` and `q`, KL divergence computes `p * log(p / q)`.
///
/// - Parameters:
///   - predicted: Predicted outputs from a neural network.
///   - expected: Expected values, i.e. targets, that correspond to the correct output.
@differentiable(wrt: predicted)
public func kullbackLeiblerDivergence<Scalar: TensorFlowFloatingPoint>(
    predicted: Tensor<Scalar>,
    expected: Tensor<Scalar>
) -> Tensor<Scalar> {
    kullbackLeiblerDivergence(predicted: predicted, expected: expected, reduction: { $0.sum() })
}

/// Returns the softmax cross entropy (categorical cross entropy) between logits and labels.
///
/// - Parameters:
///   - logits: One-hot encoded outputs from a neural network.
///   - labels: Indices (zero-indexed) of the correct outputs.
@differentiable(wrt: logits)
public func softmaxCrossEntropy<Scalar: TensorFlowFloatingPoint>(
    logits: Tensor<Scalar>,
    probabilities: Tensor<Scalar>
) -> Tensor<Scalar> {
    softmaxCrossEntropy(logits: logits, probabilities: probabilities, reduction: _mean)
}

/// Returns the sigmoid cross entropy (binary cross entropy) between logits and labels.
/// - Parameters:
///   - logits: The unscaled output of a neural network.
///   - labels: Integer values that correspond to the correct output.
@differentiable(wrt: logits)
public func sigmoidCrossEntropy<Scalar: TensorFlowFloatingPoint>(
    logits: Tensor<Scalar>,
    labels: Tensor<Scalar>
) -> Tensor<Scalar> {
    sigmoidCrossEntropy(logits: logits, labels:labels, reduction: _mean)
}

//===------------------------------------------------------------------------------------------===//
// Tensor comparison operators
//===------------------------------------------------------------------------------------------===//

extension Tensor where Scalar: Numeric & Comparable {
    /// Returns a Boolean value indicating whether the results of element-wise comparison
    /// `lhs .< rhs` are all `true`.
    @inlinable
    @available(*, deprecated, message: """
        This API will be removed after Swift for TensorFlow 0.5.
        Use `(lhs .< rhs).all()` instead.
        """)
    public static func < (lhs: Tensor, rhs: Tensor) -> Bool {
        return (lhs .< rhs).all()
    }

    /// Returns a Boolean value indicating whether the results of element-wise comparison
    /// `lhs .<= rhs` are all `true`.
    @inlinable
    @available(*, deprecated, message: """
        This API will be removed after Swift for TensorFlow 0.5.
        Use `(lhs .<= rhs).all()` instead.
        """)
    public static func <= (lhs: Tensor, rhs: Tensor) -> Bool {
        return (lhs .<= rhs).all()
    }

    /// Returns a Boolean value indicating whether the results of element-wise comparison
    /// `lhs .> rhs` are all `true`.
    @inlinable
    @available(*, deprecated, message: """
        This API will be removed after Swift for TensorFlow 0.5.
        Use `(lhs .> rhs).all()` instead.
        """)
    public static func > (lhs: Tensor, rhs: Tensor) -> Bool {
        return (lhs .> rhs).all()
    }

    /// Returns a Boolean value indicating whether the results of element-wise comparison
    /// `lhs .>= rhs` are all `true`.
    @inlinable
    @available(*, deprecated, message: """
        This API will be removed after Swift for TensorFlow 0.5.
        Use `(lhs .>= rhs).all()` instead.
        """)
    public static func >= (lhs: Tensor, rhs: Tensor) -> Bool {
        return (lhs .>= rhs).all()
    }
}

public extension Tensor where Scalar: Numeric & Comparable {
    /// Returns a Boolean value indicating whether all scalars in the first argument are less than
    ///  the second argument.
    @inlinable
    @available(*, deprecated, message: """
        This API will be removed after Swift for TensorFlow 0.5.
        Use `(lhs .< rhs).all()` instead.
        """)
    static func < (lhs: Tensor, rhs: Scalar) -> Bool {
        return (lhs .< rhs).all()
    }

    /// Returns a Boolean value indicating whether all scalars in the first argument are less than
    /// or equal to the second argument.
    @inlinable
    @available(*, deprecated, message: """
        This API will be removed after Swift for TensorFlow 0.5.
        Use `(lhs .<= rhs).all()` instead.
        """)
    static func <= (lhs: Tensor, rhs: Scalar) -> Bool {
        return (lhs .<= rhs).all()
    }

    /// Returns a Boolean value indicating whether all scalars in the first argument are greater than
    /// the second argument.
    @inlinable
    @available(*, deprecated, message: """
        This API will be removed after Swift for TensorFlow 0.5.
        Use `(lhs .> rhs).all()` instead.
        """)
    static func > (lhs: Tensor, rhs: Scalar) -> Bool {
        return (lhs .> rhs).all()
    }

    /// Returns a Boolean value indicating whether all scalars in the first argument are greater than
    /// or equal to the second argument.
    @inlinable
    @available(*, deprecated, message: """
        This API will be removed after Swift for TensorFlow 0.5.
        Use `(lhs .>= rhs).all()` instead.
        """)
    static func >= (lhs: Tensor, rhs: Scalar) -> Bool {
        return (lhs .>= rhs).all()
    }
}
