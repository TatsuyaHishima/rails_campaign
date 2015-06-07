# coding: utf-8

class PrizeController < ApplicationController
    before_action :prize_find
    def index        
    end

    def result
        # controllerで計算させるのも違う気がする
        get_prize_total = 0
        parameter = Array.new(10)

        if @prize.present? then 
            if @prize.totalNum.present? then 
                @prize_total = @prize.totalNum.to_i
            else
                @prize_total = params[:total_applicant].to_i
            end
            if @prize.firstNum.present? then
                parameter[0] = @prize.firstNum
            else
                parameter[0] = params[:first_prize_num]
            end
            if @prize.secondNum.present? then
                parameter[1] = @prize.secondNum
            else
                parameter[1] = params[:second_prize_num]
            end
            # if @prize.thirdNum.present? then
            #     parameter[2] = @prize.thirdNum
            # else
            #     parameter[2] = params[:third_prize_num]
            # end
            # if @prize.fourthNum.present? then
            #     parameter[3] = @prize.fourthNum
            # else
            #     parameter[3] = params[:fourth_prize_num]
            # end
            # if @prize.fifthNum.present? then
            #     parameter[4] = @prize.fifthNum
            # else
            #     parameter[4] = params[:fifth_prize_num]
            # end
            # if @prize.sixthNum.present? then
            #     parameter[5] = @prize.sixthNum
            # else
            #     parameter[5] = params[:sixth_prize_num]
            # end
            # if @prize.seventhNum.present? then
            #     parameter[6] = @prize.seventhNum
            # else
            #     parameter[6] = params[:seventh_prize_num]
            # end
            # if @prize.eighthNum.present? then
            #     parameter[7] = @prize.eighthNum
            # else
            #     parameter[7] = params[:eighth_prize_num]
            # end
            # if @prize.ninethNum.present? then
            #     parameter[8] = @prize.ninethNum
            # else
            #     parameter[8] = params[:nineth_prize_num]
            # end
            # if @prize.tenthNum.present? then
            #     parameter[9] = @prize.tenthNum
            # else
            #     parameter[9] = params[:tenth_prize_num]
            # end


        end

        if @prize_total == 0 then 
            @notice = "エラー: 総応募者を一人以上にしてください。"
            render 'index'
            return
        end

        for num in 0..1 do # あとで9に変える
            get_prize_total += parameter[num].to_i
        end
        if get_prize_total > @prize_total then # 当選者数が総人数を上回るとエラー 
            @notice = "エラー: 当選者数を応募者数より少なくしてください。"
            render 'index'
            return
        end

        # 当選者はflagを1にする。flag[0]は使わない
        flag = Array.new(@prize_total+1, 0) 

        # 一位から十位までの当選者を格納する配列
        prize = Array.new(11){Array.new(0)}


        for num in 0..1 do  # あとで9に変える
            max = parameter[num].to_i
            # 当選者数が1より大きい場合
            if max != 0 then 
                # max人になるまで当選者を選ぶ
                for winner in 1..max do 
                    flag_status = 0 # 一人の当選者が決まるまでループを回す
                    while flag_status == 0 do 
                        random_num = rand(@prize_total) + 1
                        if flag[random_num] == 0 then 
                            prize[num].push(random_num)
                            flag[random_num] = 1
                            flag_status = 1
                        end
                    end
                end
            end
        end
        @prize_result = prize

    end

    def detail
        unless user_signed_in?
            redirect_to(new_user_session_path)
            return
        end
    end

    private
        def prize_find
            if user_signed_in? then 
                if Prize.find_by(current_user.id).present? then
                    @prize = Prize.find_by(current_user.id)
                else
                    @prize = nil
                end
            end
        end
end
