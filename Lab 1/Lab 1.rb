class ComplexNumber
    @@oper_stats = {:add => 0, :multiply => 0}
    attr_reader :real_num, :img_num

    def initialize(real,img)
        @real_num = real
        @img_num = img
    end

    def +(cn)
        @@oper_stats[:add]+=1
        ComplexNumber.new(real_num + cn.real_num, img_num + cn.img_num)

    end

    def *(cn)
        new_real = real_num * cn.real_num - img_num * cn.img_num
        new_imaginary = img_num * cn.real_num + real_num * cn.img_num
        @@oper_stats[:multiply]+=1
        ComplexNumber.new(new_real, new_imaginary)
    end

    def bulk_add(cns)
        cns.each do |cn|
            @real_num += cn.real_num
            @img_num += cn.img_num
            @@oper_stats[:add]+=1
        end
    end

    def bulk_multiply(cns)
        cns.each do |cn|
            new_real = @real_num * cn.real_num - img_num * cn.img_num
            @img_num = @img_num * cn.real_num + @img_num * cn.img_num
            @real_num = new_real
            @@oper_stats[:multiply]+=1
        end
    end

    def print
        puts "#{@real_num} + #{@img_num}i"
    end

    def get_stats
        puts @@oper_stats
    end
end

x = ComplexNumber.new(1,2)
y = ComplexNumber.new(3,4)

z = x + y
z.print

f = x * y
f.print
f.get_stats

x.bulk_add([x,x])
x.print


