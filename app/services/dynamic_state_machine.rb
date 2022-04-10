# frozen_string_literal: true

# A model to utilize DynamicStateMachine have to have the following attributes:
# 1) 'states_data' - states in their order of transitioning
# 2) 'current_state_index' - index of current state the model is in, starts from 0
class DynamicStateMachine
  def initialize(record)
    @record = record
  end

  def transition!(to_state)
    states_data = record.states_data
    next_state_index = record.current_state_index + 1

    halt unless to_state <= states_data.last && to_state == next_state_index

    record.update!(current_state_index: to_state)
  end

  private

  attr_accessor :record

  def halt
    raise StateTransitionError
  end
end
