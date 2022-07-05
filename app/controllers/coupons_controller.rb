class CouponsController < ApplicationController
    def new
      @coupons = Coupon.new
    end

    def index
        @coupons = Coupon.all
    end

    def show
        @coupon = Coupon.find(params[:id])
    end

    def create
        @coupon = Coupon.new
        # @coupon.coupon_code = params[:coupon_code]
        # @coupon.store = params[:store]
        # above code was giving form page errors. WOuldn't submit/render form content NOR create record in db
        @coupon[:coupon_code] = params[:coupon][:coupon_code]
        @coupon[:store] = params[:coupon][:store]
        @coupon.save
        redirect_to coupon_path(@coupon)

        # note that params: { :coupon => { :coupon_code => "hhh", :store => "ghgh"} }
    end

end