#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericMatrix symadj(NumericVector Eg, size_t n) {
  size_t k = 0;
  NumericMatrix W(n,n);
  for(size_t i = 0; i < n; i++) {
    for(size_t j = i; j < n; j++) {
      W[i + j * n] = W[j + i * n] = Eg[k];
      k++;
    }
  }
  return W;
}

// [[Rcpp::export]]
void sum_W_Wt_graph(NumericMatrix W) {
  size_t n = W.nrow(), ind1, ind2;
  for(size_t i = 0; i < n; i++) {
    for (size_t j = 0; j <= i; j++){
      ind1 = i * n + j;
      ind2 = j * n + i;
      W[ind1] = W[ind2] = W[ind1] + W[ind2];
    }
  }
  //return W;
}

// [[Rcpp::export]]
NumericMatrix sum_W_Wt(NumericMatrix W) {
  size_t n = W.nrow(), ind1, ind2;
  for(size_t i = 0; i < n; i++) {
    for (size_t j = 0; j <= i; j++){
      ind1 = i * n + j;
      ind2 = j * n + i;
      W[ind1] = W[ind2] = W[ind1] + W[ind2];
    }
  }
  return W;
}

// [[Rcpp::export]]
IntegerVector score_out(NumericMatrix W, NumericVector str_tmp) {
  
  size_t n = str_tmp.length(), prevstart = 0;
  int ct = 1;
  double s_thr = 0;
  bool anynonzero = false;
  std::vector<bool> tokeep(n);
  IntegerVector s_core(n);
  
  for(size_t i = 0; i < n; i++) {
    if(str_tmp[i] > 0){
      tokeep[i] = true;
    }
  }
  
  for(size_t i = 0; i < n; i++) {
    if(tokeep[i]){
      anynonzero = true;
      s_thr = str_tmp[i];
      prevstart = i + 1;
      break;
    }
  }
  
  while (anynonzero) {
    
    for(size_t i = prevstart; i < n; i++) {
      if ((str_tmp[i] < s_thr) && tokeep[i]){
        s_thr = str_tmp[i];
      }
    }
    
    for(size_t i = 0; i < n; i++) {
      // if (str_tmp[i] <= s_thr && tokeep[i])
      if (str_tmp[i] == s_thr && tokeep[i]){
        s_core[i] = ct;
        tokeep[i] = false;
      }
    }
    
    for(size_t i = 0; i < n; i++) {
      // if (str_tmp[i] <= s_thr && tokeep[i])
      if (s_core[i] == ct){
        for(size_t j = 0; j < n; j++) {
          if (tokeep[j]){
            str_tmp[j]  -= W[i * n + j];
          }
        }
      }
    }
    
    ct++;
    
    anynonzero = false;
    for(size_t i = 0; i < n; i++) {
      if(tokeep[i]){
        anynonzero = true;
        s_thr = str_tmp[i];
        prevstart = i + 1;
        break;
      }
    }
  }
  return s_core;
}


// [[Rcpp::export]]
IntegerVector score_in(NumericMatrix W, NumericVector str_tmp) {
  
  size_t n = str_tmp.length(), prevstart = 0;
  int ct = 1;
  double s_thr = 0;
  bool anynonzero = false;
  std::vector<bool> tokeep(n);
  IntegerVector s_core(n);
  
  // for(size_t i = 0; i < n; i++) {
  //   if(str_tmp[i] > 0){
  //     tokeep[i] = true;
  //     if (!anynonzero){
  //       anynonzero = true;
  //       s_thr = str_tmp[i];
  //     }
  //   }
  // }
  
  for(size_t i = 0; i < n; i++) {
    if(str_tmp[i] > 0){
      tokeep[i] = true;
    }
  }
  
  for(size_t i = 0; i < n; i++) {
    if(tokeep[i]){
      anynonzero = true;
      s_thr = str_tmp[i];
      prevstart = i + 1;
      break;
    }
  }
  
  while (anynonzero) {
    
    for(size_t i = prevstart; i < n; i++) {
      if ((str_tmp[i] < s_thr) && tokeep[i]){
        s_thr = str_tmp[i];
      }
    }
    
    for(size_t i = 0; i < n; i++) {
      // if (str_tmp[i] <= s_thr && tokeep[i])
      if (str_tmp[i] == s_thr && tokeep[i]){
        s_core[i] = ct;
        tokeep[i] = false;
      }
    }
    
    for(size_t i = 0; i < n; i++) {
      // if (str_tmp[i] <= s_thr && tokeep[i])
      if (s_core[i] == ct){
        for(size_t j = 0; j < n; j++) {
          if (tokeep[j]){
            str_tmp[j]  -= W[j * n + i];
          }
        }
      }
    }
    
    ct++;
    
    anynonzero = false;
    for(size_t i = 0; i < n; i++) {
      if(tokeep[i]){
        anynonzero = true;
        s_thr = str_tmp[i];
        prevstart = i + 1;
        break;
      }
    }
  }
  return s_core;
}
