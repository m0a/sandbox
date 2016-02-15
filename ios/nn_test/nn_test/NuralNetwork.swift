//
//  NuralNetwork.swift
//  nn_test
//
//  Created by m0a on 2015/08/21.
//  Copyright © 2015年 m0a. All rights reserved.
//

import Foundation
import Accelerate

func sigmoid(z:la_object_t) ->la_object_t {
    //1.0 ./ (1.0 + exp(-z));
    let rows = z.rows
    let cols = z.cols
    
    let array = z.toArray
    let calcArray =  array.map { (v:Double) -> Double in
        1.0 / (1.0 + exp(-v))
    }
    
    return la_matrix_from_double_array(calcArray,rows: rows,columns: cols)

}

func sigmoidGradient(z:la_object_t) -> la_object_t {
    let sigmoid_z = sigmoid(z)
    return la_elementwise_product(sigmoid_z, 1 - sigmoid_z)
}



typealias Resulttuple = (result:Int,present:Double)

func predict(theta1:la_object_t,theta2:la_object_t,x :la_object_t) -> [Resulttuple] {
    
    /*
    m = size(X, 1);
    num_labels = size(Theta2, 1);
    
    % You need to return the following variables correctly
    p = zeros(size(X, 1), 1);
    
    
    a1 = [ones(size(X,1),1),X];
    % size(a1)
    a2 = sigmoid(Theta1 * a1');
    a2 = [ones(size(a2',1),1),a2'];
    % size(a2)
    a3 = sigmoid(Theta2 * a2');
    % size(a3)
    [temp,p] = max(a3',[],2);

*/
    
    let a1 = x.ones_left_appends()
    let a2 = sigmoid(la_matrix_product(theta1, la_transpose(a1)))
    let a2dash = la_transpose(a2).ones_left_appends()
    let a3 = sigmoid(la_matrix_product(theta2, la_transpose(a2dash)))
    let results = la_transpose(a3).matrix
    var returnArray = [Resulttuple]()
    for oneResult in results {
        var oneMax = 0.0
        var oneIndex:Int = 0
        for i in 0..<oneResult.count {
            if (oneResult[i] > oneMax) {
                oneMax = oneResult[i]
                oneIndex = Int(i+1)
            }
        }
        var tupple:(result:Int,present:Double)
        tupple.result = oneIndex
        tupple.present = oneMax
        returnArray.append(tupple)
    }
    return returnArray
    
}

enum NuralNetworkError : ErrorType {
    case unknown
    //入力のサイズとニューロンのサイズが不一致
    case inputSizeMismath
    //トレーニング済み
    case trainingDone
    //トレーニング未実施
    case donotTrainningEND
    // Calculatetion Error
    
    case CalcError

    
}


class NuralNetwork : CustomDebugStringConvertible,CustomStringConvertible {
    //nuralnetwork waits(thetas)
    internal var params:[Double] = [Double]()
    internal var hiddenLayerSize:Int = 25
    internal var inputLayerSize:Int = 400
    internal var outputLayerSize:Int = 10
    internal var isTrainingDone = false
    //randam param range
    internal let initEpsilon = 0.005
    func randEpsilon(epsilon:Double) -> Double {
        let e = Double( Double(rand() % 5000)/5000.0 )
        return e * epsilon - epsilon/2
    }
    
    func boolToDouble(input:Bool) -> Double {
        return input ? 1.0 : 0.0
    }

   
    var debugDescription:String {
        return "NN{input:\(inputLayerSize),hiddin:\(hiddenLayerSize)" +
        ",output:\(outputLayerSize),trainningDone:\(isTrainingDone)" +
        ",params:\(params)}"
    }
    
    var description:String {
        return "NN{input:\(inputLayerSize),hiddin:\(hiddenLayerSize)" +
            ",output:\(outputLayerSize),trainningDone:\(isTrainingDone)}"
    }
    
     func reset(
        inputLayerSize:Int,
        hiddenLayerSize:Int,
        outputLayerSize:Int
        ) {
        
        self.inputLayerSize = inputLayerSize
        self.hiddenLayerSize = hiddenLayerSize
        self.outputLayerSize = outputLayerSize
            
        params = [Double]()
        for _ in 0 ..< (theta1Size + theta2Size) {
            params.append(randEpsilon(initEpsilon))
        }
    }
    
    init() {
        reset(inputLayerSize, hiddenLayerSize: hiddenLayerSize, outputLayerSize: outputLayerSize)
    }
    
    var theta1Size:Int {
        return self.inputLayerSize * (self.hiddenLayerSize) + 1
    }
    
    var theta2Size:Int {
        return self.hiddenLayerSize * (self.outputLayerSize) + 1
    }
    
    
    func expandBoolArrayOutput(y:[Int])->[[Bool]] {
        
        return y.map { (y:Int) -> [Bool] in
            var ret = [Bool]()
            for index in 0 ..< outputLayerSize {
                ret.append(index == y)
            }
            return ret
        }
    }
    
    func boolArrayToDoubleArray(input:[Bool]) -> [Double] {
        return input.map { $0 ? 1.0 : 0.0 }
    }
    
    func exapndDoubleArrayOutput(y:[Int]) -> [[Double]] {
        return expandBoolArrayOutput(y).map { return boolArrayToDoubleArray($0)}
    }

    
    func cost(inputX:[Double], inputY:[Int], lambda:Double) throws {
        
        guard isTrainingDone == false else {
            throw NuralNetworkError.donotTrainningEND
        }
        guard inputX.count % inputLayerSize == 0 else {
            throw NuralNetworkError.inputSizeMismath
        }
        let theta1 = la_matrix_from_double_array([Double](params[0 ..< theta1Size]), rows: UInt(hiddenLayerSize), columns: UInt(inputLayerSize + 1))
//        print(theta1)
        let theta2 = la_matrix_from_double_array([Double](params[theta1Size ..< params.count]), rows: UInt(outputLayerSize), columns: UInt(hiddenLayerSize + 1))
//        print(theta2)
    
        let m = inputLayerSize
    
        var j = 0.0
    
//        _ = theta1 * 0.0
//        _ = theta2 * 0.0
//        
            /*
            Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
            hidden_layer_size, (input_layer_size + 1));
            
            Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
            num_labels, (hidden_layer_size + 1));
            
            % Setup some useful variables
            m = size(X, 1);
            
            % You need to return the following variables correctly
            J = 0;
            Theta1_grad = zeros(size(Theta1));
            Theta2_grad = zeros(size(Theta2));
        
            temp = y;
            y = [];
            for k = 1:num_labels,
            y = [y temp == k];
            endfor
            
            a1 = [ones(size(X,1),1) X];
            % size(a1);
            z2 = Theta1 * a1';
            % size(z2);
            a2 = sigmoid(z2);
            a2 = [ones(size(a2',1),1) a2'];
            % size(a2);
            z3 = Theta2 * a2';
            z3 = z3';
            a3 = sigmoid(z3);
            % size(a3)
            s = -y.*log(a3) - (ones(size(a3)) - y).*log(ones(size(a3)) - a3);
            Theta12 = Theta1(:,2:size(Theta1,2)).^2;
            Theta22 = Theta2(:,2:size(Theta2,2)).^2;
            J = 1/m * sum(s(:));
            J +=lambda /(2 * m) * (sum(Theta12(:))+sum(Theta22(:)));
        
        */
        
        let doubleYArray = exapndDoubleArrayOutput(inputY)
        let a1 = la_matrix_from_double_array(inputX, rows: UInt(inputX.count/inputLayerSize) , columns: UInt(inputLayerSize))
        guard let y = la_matrix_from_double_array(doubleYArray) else {
            throw NuralNetworkError.CalcError
        }
        
        print("a1 = \(a1)")
        let a1_2 = a1.ones_left_appends()
        print(a1_2)
        let z2 = theta1 * (a1_2.t)
        print("z2 = \(z2)")
        let a2 = sigmoid(z2)
        let a2_2 = a2.t.ones_left_appends()
        print(a2_2)
        let z3 = theta2 * (a2_2.t)
        let z3t = z3.t
        let a3 = sigmoid(z3t)
//        print(a3)
//        print(y)
//        print(-1.0 * y)
        let s  = la_elementwise_product(-1.0 * y, a3) - la_elementwise_product(1 - y, log(1 - a3))
        let theta1_2 = la_elementwise_product(theta1, theta1)
        let theta2_2 = la_elementwise_product(theta2, theta2)
        j = 1.0 / Double(m) * s.toArray.reduce(0.0) { $0 + $1 }
        
        let special_sum = { (o:la_object_t) -> Double in
            var array = o.toArray
            
            for i in 0 ..< o.rows {
                array[Int(i * o.cols)] = 0.0
            }
            
            return array.reduce(0.0) { $0 + $1}
        }
        
        j += lambda / (2.0 * Double(m)) * ( special_sum(theta1_2) + special_sum(theta2_2))
        
        print(j)
        
        
        
        /*
            delta3 = a3 - y;
            delta2 = (Theta2' * delta3')(2:end,:).* sigmoidGradient(z2);
            D1 = delta2 * a1;
            D2 = delta3' * a2;
            D1_lambda = lambda/m * Theta1;
            D2_lambda = lambda/m * Theta2;
            D1_lambda(:,1) = zeros(size(Theta1,1),1);
            D2_lambda(:,1) = zeros(size(Theta2,1),1);
            Theta1_grad = 1/m * D1 + D1_lambda;
            Theta2_grad = 1/m * D2 + D2_lambda;
            
            % =========================================================================
            
            % Unroll gradients
            grad = [Theta1_grad(:) ; Theta2_grad(:)];
*/
//        let delta3 = a3 - y
//        let delta2 = (theta2.t) * (delta3.t)
//        let delCol0 = { (o:la_object_t) -> la_object_t in
//            var array = o.toArray
//            array = [Double](array[Int(o.cols) ..< array.count])
//            return la_matrix_from_double_array(array, rows: o.rows - 1, columns: <#T##UInt#>)
//            
//        }
//        
        
//        let delta2 =
        
    }
    
    //訓練入力
     func startTraning(x:[Double]) throws {
        if x.count != inputLayerSize {
            throw NuralNetworkError.inputSizeMismath
        }
        
        
        if isTrainingDone {
            throw NuralNetworkError.trainingDone
        }
//        resetParams(inputLayerSize,hiddenLayerSize,outputLayerSize)
        
        
        
        
    }
    
    typealias TestResult = (resultIndex:Int,persentage:Double)
     func test(x:[Double]) throws -> TestResult {
        if x.count != inputLayerSize {
            throw NuralNetworkError.inputSizeMismath
        }
        
        return TestResult(0,0)
        
    }
    
    
    
    
    
    
    
    
}