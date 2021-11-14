//
//  sentens.swift
//  randomcode_applyCh1
//
//  Created by 윤병희 on 2021/10/31.
//

import Foundation


struct CodeTypeBlock {
    let codeName : String
    let codeUsing : String
}


let originCodes = [
    CodeTypeBlock(codeName : "clear" , codeUsing : "터미널의 모든 내용을 삭제 \n clear 후에 위에내용보고싶으면 스크롤로 올릴 수 있음"),
    CodeTypeBlock(codeName: "open .", codeUsing: "현 디렉토리를 연다."),
    CodeTypeBlock(codeName: "ls", codeUsing: "  현재 디렉토리의 리스트 나타낸다" ),
    CodeTypeBlock(codeName: "cd", codeUsing: "디렉터리를 이동한다."),
    CodeTypeBlock(codeName: "pwd", codeUsing: "Print Working Directory 로써 지금 경로가 어디인지 알려준다.")
]

let githubCodes = [
    CodeTypeBlock(codeName: "git clone 주소", codeUsing: "저장소의 복사본을 생성해 준다."),
    CodeTypeBlock(codeName: "git status", codeUsing: "현재 작업 상태를 출력한다."),
    CodeTypeBlock(codeName: "git init", codeUsing: "현재 디렉터리에 Git 저장소를 생성한다."),

    
]
