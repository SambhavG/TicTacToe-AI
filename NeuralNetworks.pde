
class NeuralNetwork {
  
  int NumOfLayers;
  int[] NodesInEachLayer;
  float[][] NodeStrengths; //stores strength of each node
  float[][][] NodeConnections; //stores strength of each connection from each node
  
  NeuralNetwork(int[] LayerSizes) {
    
    NumOfLayers = LayerSizes.length; //Sets num of layers
    
    //Sets NodesInEachLayer
    NodesInEachLayer = new int[NumOfLayers];
    for (int i = 0; i < NumOfLayers; i++) {
      NodesInEachLayer[i] = LayerSizes[i];
    }
    
    //Sets NodeStrengths
    NodeStrengths = new float[NumOfLayers][];
    for (int i = 0; i < NumOfLayers; i++) {
      NodeStrengths[i] = new float[NodesInEachLayer[i]];
      for (int j = 0; j < NodesInEachLayer[i]; j++) {
        NodeStrengths[i][j] = random(0,1);
      }
    }
    
    //Sets NodeConnections
    NodeConnections = new float[NumOfLayers][][];
    for (int i = 0; i < NumOfLayers; i++) {
      NodeConnections[i] = new float[NodesInEachLayer[i]][];
      for (int j = 0; j < NodesInEachLayer[i]; j++) {
        if (i != NodesInEachLayer.length - 1) {
          NodeConnections[i][j] = new float[NodesInEachLayer[i+1]];
          for (int k = 0; k < NodesInEachLayer[i+1]; k++) {
            NodeConnections[i][j][k] = random(0,1);
          }
        } 
      }
     }  
   }
  
  NeuralNetwork deepCopy(int[] SizesOfLayers){
    NeuralNetwork foo = new NeuralNetwork(SizesOfLayers);
    foo.NumOfLayers = NumOfLayers;
    foo.NodesInEachLayer = NodesInEachLayer;
    
    
    for (int i = 0; i < NodesInEachLayer.length-1; i++) {
      for (int j = 0; j < NodesInEachLayer[i]; j++) {
        for (int k = 0; k < NodesInEachLayer[i+1]; k++) {
          foo.NodeConnections[i][j][k] = (float) NodeConnections[i][j][k];
        }
      }
    }
  
    for (int i = 0; i < NodesInEachLayer.length-1; i++) {
      for (int j = 0; j < NodesInEachLayer[i]; j++) {
        foo.NodeStrengths[i][j] = (float) NodeStrengths[i][j];
      }
    }
    
    return foo;
  }
  
  
  float[][] getNodeStrengths() {
    return NodeStrengths;  
  }
  
  float[][][] getNodeConnections() {
    return NodeConnections;
  }
  
  int[] getNodesInEachLayer() {
    return NodesInEachLayer;
  }
  
  void setNodesInEachLayer(int[] inputNodesInEachLayer) {
    NodesInEachLayer = inputNodesInEachLayer;
  }
  
  void setNodeStrengths(float[][] inputStrengths) {
    NodeStrengths = inputStrengths;
  }
  
  void setNodeConnections(float[][][] inputConnections) {
    NodeConnections = inputConnections;    
  }
  
  void set1NodeStrengths(int i, int j, float val) {
    NodeStrengths[i][j] = val;
  }
  
  void set1NodeConnections(int i, int j, int k, float val) {
    NodeConnections[i][j][k] = val;    
  }
  
  void randomizeAll() {
    
    //Sets NodeStrengths
    NodeStrengths = new float[NumOfLayers][];
    for (int i = 0; i < NumOfLayers; i++) {
      NodeStrengths[i] = new float[NodesInEachLayer[i]];
      for (int j = 0; j < NodesInEachLayer[i]; j++) {
        NodeStrengths[i][j] = random(0,1);
      }
    }
    
    //Sets NodeConnections
    NodeConnections = new float[NumOfLayers][][];
    for (int i = 0; i < NumOfLayers; i++) {
      NodeConnections[i] = new float[NodesInEachLayer[i]][];
      for (int j = 0; j < NodesInEachLayer[i]; j++) {
        if (i != NodesInEachLayer.length - 1) {
          NodeConnections[i][j] = new float[NodesInEachLayer[i+1]];
          for (int k = 0; k < NodesInEachLayer[i+1]; k++) {
            NodeConnections[i][j][k] = random(0,1);
          }
        }
        
      }
    }
    
    
  }
  
  float[] CalculateValues(float[] NodeInputs) {
    float[] BeforeNodes = new float[300];
    float[] AfterNodes = new float[300];
    for (int i = 0; i < NodesInEachLayer[0]; i++) {
      BeforeNodes[i] = NodeInputs[i] * NodeStrengths[0][i];
        
    }
    
    for (int i = 1; i < NumOfLayers; i++) {//Iterates through layers, starting with second layer
      for (int j = 0; j < NodesInEachLayer[i]; j++) { //Iterates through nodes
        float sum = 0;
        for (int k = 0; k < NodesInEachLayer[i-1]; k++) { //Iterates through nodes in previous layer
          sum+= (float) BeforeNodes[k]*NodeConnections[i-1][k][j];
          //print((float) BeforeNodes[k]*NodeConnections[i-1][k][j]);
        }
        AfterNodes[j] = (float) sum*NodeStrengths[i][j];

      }
      
      BeforeNodes = new float[300];
      for (int j = 0; j < NodesInEachLayer[i]; j++) {
        BeforeNodes[j] = AfterNodes[j];
      }
      AfterNodes = new float[300];
    }
    
    return BeforeNodes;
    
    
  }
  
  float CalculateAndReturnHighestNodeNumber(float[] NodeInputs) {
    float highestNumber = 0;
    int correspondingNode = 0;
    float[] vals = CalculateValues(NodeInputs);
    
    for(int i = 0; i < vals.length; i++) {
      if (highestNumber < vals[i]) {
         highestNumber = vals[i]; 
         correspondingNode = i+1;
      }
      
    }
    
    return correspondingNode;
  }
  
  
  
  
  void RandomizeSlightly(float factor1, float factor2) {
    
    //Adds random factor to NodeStrengths
    //NodeStrengths = new float[NumOfLayers][];
    for (int i = 0; i < NumOfLayers; i++) {
      //NodeStrengths[i] = new float[NodesInEachLayer[i]];
      for (int j = 0; j < NodesInEachLayer[i]; j++) {
        NodeStrengths[i][j]+=random(-factor1, factor1);
      }
    }
    
    //Adds random factor to NodeConnections
    //NodeConnections = new float[NumOfLayers][][];
    for (int i = 0; i < NumOfLayers; i++) {
      //NodeConnections[i] = new float[NodesInEachLayer[i]][];
      for (int j = 0; j < NodesInEachLayer[i]; j++) {
        if (i != NodesInEachLayer.length - 1) {
          //NodeConnections[i][j] = new float[NodesInEachLayer[i+1]];
          for (int k = 0; k < NodesInEachLayer[i+1]; k++) {
            NodeConnections[i][j][k]+=random(-factor2, factor2);
          }
        }
        
      }
    }
    
  }
  
}




float findSmallestNumber(float[] nums) {
   float smallestNum = nums[0];
   for (int i = 0; i < nums.length; i++) {
      if (nums[i] < smallestNum) {
         smallestNum = nums[i]; 
      }
   }
   return smallestNum; 
}

float findLargestNumber(float[] nums) {
   float largestNum = nums[0];
   for (int i = 0; i < nums.length; i++) {
      if (nums[i] > largestNum) {
         largestNum = nums[i]; 
      }
   }
   return largestNum; 
}
 
NeuralNetwork[] NeuralNetworkSelectionSortArrayLists(NeuralNetwork[] networksToSort, float[] scores) { //ArrayList based selection sorter
  
  ArrayList<NeuralNetwork> UnsortedArray = new ArrayList<NeuralNetwork>(); //Defines arraylist of unsorted networks
  ArrayList<NeuralNetwork> arrayListResult = new ArrayList<NeuralNetwork>(); //Defines resulting array list - eventually converted to resultArray and returned
  FloatList UnsortedScores = new FloatList(); //Defines arraylist of unsorted scores - parallel to UnsortedArray
  NeuralNetwork[] resultArray = new NeuralNetwork[networksToSort.length]; //arrayListResult converted to this eventually and returned

  for (int i = 0; i < networksToSort.length; i++) { UnsortedArray.add(networksToSort[i]);} //Converts networksToSort input to UnsortedArray
  for (int i = 0; i < scores.length; i++) { UnsortedScores.append(scores[i]);} //Converts scores input to UnsortedScores
  
  
  float lowestCurrentScore = 200000000; //FIX large number that is larger than highest possible score
  int elementWithLowestScore = 0; //Marks element with lowest score for removing from arrays
  int NumberOfNetworks = networksToSort.length;
  
  for (int i = 0; i < NumberOfNetworks; i++) { //iterates through sorting states
      for (int j = 0; j < UnsortedScores.size(); j++) { //iterates through elements
        if (UnsortedScores.get(j) < lowestCurrentScore) { //if current network's score is less than the lowest score so far, set the network as new lowest
           lowestCurrentScore = UnsortedScores.get(j);
           elementWithLowestScore = j;

        }
      }
      
      arrayListResult.add(UnsortedArray.get(elementWithLowestScore)); //Add lowest scoring network to arrayListResult
      
      UnsortedArray.remove(elementWithLowestScore); //remove network and score from their unsorted arrays
      UnsortedScores.remove(elementWithLowestScore);
      
      lowestCurrentScore = 200000000; //reset lowestCurrentScore
  }
  
  for (int i = 0; i < networksToSort.length; i++) { resultArray[i] = arrayListResult.get(i);} //convert arrayListResult to ResultArray
  
  return resultArray;
  
}
