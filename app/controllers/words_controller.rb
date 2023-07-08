class WordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]
  before_action :set_words, only: [:index, :search]
  
  def index
    @total_posts = current_user.words.count if user_signed_in?
    @dummy_words = [
      { korean: "객체 지향", japanese: "オブジェクト指向" },
      { korean: "알고리즘", japanese: "アルゴリズム" },
      { korean: "데이터베이스", japanese: "データベース" },
      { korean: "보안", japanese: "セキュリティ" },
      { korean: "디버깅", japanese: "デバッグ"},
      { korean: "설치", japanese: "インストール"},
      { korean: "유효성 검사", japanese: "バリデーション"},
      { korean: "캐시", japanese: "キャッシュ"},
      { korean: "반응형", japanese: "レスポンシブ"},
      { korean: "지원", japanese: "サポート"},
      { korean: "프록시", japanese: "プロキシ"},
      { korean: "데이터 분석", japanese: "データ分析"},
      { korean: "모듈", japanese: "モジュール"},
      { korean: "실시간", japanese: "リアルタイム"},
      { korean: "성능", japanese: "パフォーマンス"},
      { korean: "인코딩", japanese: "エンコーディング"},
      { korean: "배포", japanese: "デプロイ"},
      { korean: "컴파일", japanese: "コンパイル"},
      { korean: "쿼리", japanese: "クエリ"},
      { korean: "명령 줄", japanese: "コマンドライン"},
      { korean: "중첩", japanese: "ネスト"},
      { korean: "저장소", japanese: "リポジトリ"},
      { korean: "병합", japanese: "マージ"},
      { korean: "구성", japanese: "コンフィグレーション"},
      { korean: "오류 처리", japanese: "エラーハンドリング"},
      { korean: "객체", japanese: "オブジェクト"},
      { korean: "매개변수", japanese: "パラメーター"},
      { korean: "응답", japanese: "レスポンス"},
      { korean: "단위 테스트", japanese: "単体テスト"},
      { korean: "통합 테스트", japanese: "結合テスト"}
    ]
      @word = @dummy_words.sample
  end
  
  def random_word
    @word = @dummy_words.sample
  end
  

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end
  

  def destroy
    word = Word.find(params[:id])
    word.destroy
    redirect_to user_path(current_user)  
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def search
    keyword = params[:keyword].to_s.strip
    if keyword.empty?
      redirect_to root_path
    else
      @words = Word.search(keyword)
    end
  end

  private

  def set_words
    if user_signed_in?
      user_posts = current_user.words
      @total_posts = user_posts.count
      @words = user_posts.order(created_at: :ASC).page(params[:page])
    else
      @words = Word.all.order(created_at: :ASC).page(params[:page])
    end
  end
  
  def word_params
    params.require(:word).permit(:korean, :japanese).merge(user_id: current_user.id)
  end
end
